(define-module (slack)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary)
  #:use-module (nonguix licenses))

(define-public slack
  (package
   (name "slack")
   (version "4.17.0-0.1.fc21")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://downloads.slack-edge.com/linux_releases/slack-" version ".x86_64.rpm"))
            (sha256
             (base32
              "04kkx10q0acn8z270r6wbkapwny5ikd250amjpli6qgin19a4ya7"))))
   (build-system binary-build-system)
   (arguments
    `(#:validate-runpath? #f ;; fails on the shipped .so files
      #:patchelf-plan
      `(("usr/lib/slack/slack"
         ("out"
          "alsa-lib"
          "at-spi2-atk"
          "at-spi2-core"
          "atk"
          "cairo"
          "cups"
          "curl"
          "dbus"
          "expat"
          "fontconfig"
          "freetype"
          "gconf"
          "gdk-pixbuf"
          "glib"
          "gcc:lib"
          "gtk+"
          "libappindicator"
          "libdrm"
          "libnotify"
          "libx11"
          "libxcb"
          "libxcomposite"
          "libxdamage"
          "libxcursor"
          "libxext"
          "libxfixes"
          "libxkbcommon"
          "libxrandr"
          "libxrender"
          "libxshmfence"
          "libxtst"
          "mesa"
          "nspr"
          "pango"
          "pulseaudio"))
        ("usr/lib/slack/chrome-sandbox" ())
        ("usr/lib/slack/libffmpeg.so" ("gcc:lib"))
        ("usr/lib/slack/libEGL.so" ("gcc:lib"))
        ("usr/lib/slack/libGLESv2.so" ("libx11" "libxcb" "gcc:lib" "libxext"))
        ("usr/lib/slack/libvk_swiftshader.so" ("gcc:lib"))
        ("usr/lib/slack/libvulkan.so.1" ("gcc:lib")))
      #:install-plan
      `(("etc/" "etc")
        ("usr/" "usr")
        ("usr/lib/slack/libffmpeg.so" "lib/")
        ("usr/lib/slack/libEGL.so" "lib/")
        ("usr/lib/slack/libGLESv2.so" "lib/")
        ("usr/lib/slack/libvk_swiftshader.so" "lib/")
        ("usr/lib/slack/libvulkan.so.1" "lib/"))
      #:phases
      (modify-phases %standard-phases
                     (replace 'unpack
                              (lambda* (#:key inputs #:allow-other-keys)
                                (let ((source (assoc-ref inputs "source")))
                                  (system (format #f "rpm2cpio ~a | cpio -idmv" source))
                                  (mkdir "lib")
                                  #t)))
                     ;; because NSS stores its libraries in lib/nss
                     (add-after 'patchelf 'patchelf-nss
                                (lambda* (#:key inputs #:allow-other-keys)
                                  (use-modules (ice-9 popen))
                                  (use-modules (ice-9 rdelim))
                                  (let* ((nss (assoc-ref inputs "nss"))
                                         (rpath-pipe (open-input-pipe
                                                      "patchelf --print-rpath usr/lib/slack/slack"))
                                         (rpath (read-line rpath-pipe)))
                                    (close-pipe rpath-pipe)
                                    (invoke "patchelf" "--set-rpath"
                                            (string-append rpath ":" nss "/lib/nss")
                                            "usr/lib/slack/slack"))))
                     (add-after 'install 'install-symlink
                                (lambda* (#:key outputs #:allow-other-keys)
                                  (let ((out (string-append (assoc-ref outputs "out"))))
                                    (mkdir (string-append out "/bin"))
                                    (symlink (string-append out "/usr/lib/slack/slack")
                                             (string-append out "/bin/slack"))
                                    #t))))))
   (inputs
    `(("alsa-lib" ,alsa-lib)
      ("at-spi2-atk" ,at-spi2-atk)
      ("at-spi2-core" ,at-spi2-core)
      ("atk" ,atk)
      ("cairo" ,cairo)
      ("cups" ,cups)
      ("curl" ,curl)
      ("dbus" ,dbus)
      ("expat" ,expat)
      ("fontconfig" ,fontconfig)
      ("freetype" ,freetype)
      ("gconf" ,gconf)
      ("gcc:lib" ,gcc "lib")
      ("gdk-pixbuf" ,gdk-pixbuf)
      ("glib" ,glib)
      ("gtk+" ,gtk+)
      ("libappindicator" ,libappindicator)
      ("libdrm" ,libdrm)
      ("libnotify" ,libnotify)
      ("libx11" ,libx11)
      ("libxcb" ,libxcb)
      ("libxcomposite" ,libxcomposite)
      ("libxcursor" ,libxcursor)
      ("libxdamage" ,libxdamage)
      ("libxext" ,libxext)
      ("libxfixes" ,libxfixes)
      ("libxkbcommon" ,libxkbcommon)
      ("libxrandr" ,libxrandr)
      ("libxrender" ,libxrender)
      ("libxshmfence" ,libxshmfence)
      ("libxtst" ,libxtst)
      ("mesa" ,mesa)
      ("nss" ,nss)
      ("nspr" ,nspr)
      ("pango" ,pango)
      ("pulseaudio" ,pulseaudio)))
   (propagated-inputs
    `(("libnotify" ,libnotify)))
   (native-inputs
    `(("cpio" ,cpio)
      ("rpm" ,rpm)
      ("patchelf" ,patchelf)))
   (synopsis "A businness communication platform")
   (description "A businness communication platform")
   (home-page "https://slack.com/")
   (supported-systems '("x86_64-linux"))
   (license (nonfree "Nowhere to be found"))))
