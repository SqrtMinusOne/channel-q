(define-module (vk-messenger)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages node)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages package-management)
  #:use-module (ice-9 popen)
  #:use-module (ice-9 rdelim)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary)
  #:use-module (nonguix licenses))

(define-public vk-messenger
  (package
   (name "vk-messenger")
   (version "5.2.3")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://desktop.userapi.com/rpm/master/vk-" version ".x86_64.rpm"))
            (sha256
             (base32
              "1m6saanpv1k5wc5s58jpf0wsgjsj7haabx8nycm1fjyhky1chirb"))))
   (build-system binary-build-system)
   (arguments
    `(#:validate-runpath? #f ;; fails on the shipped .so files
      #:patchelf-plan
      `(("usr/share/vk/vk" ("alsa-lib"
                            "atk"
                            "at-spi2-atk"
                            "cairo"
                            "cups"
                            "dbus"
                            "fontconfig"
                            "gtk+"
                            "gdk-pixbuf"
                            "out"
                            "gcc:lib"
                            "glib"
                            "expat"
                            "libx11"
                            "libxcb"
                            "libxcomposite"
                            "libxcursor"
                            "libxdamage"
                            "libxext"
                            "libxfixes"
                            "libxi"
                            "libxkbfile"
                            "libxrandr"
                            "libxrender"
                            "libxscrnsaver"
                            "libxsts"
                            ;; "nss"
                            "nspr"
                            "pango"))
        ("usr/share/vk/libffmpeg.so" ("gcc:lib"))
        ("usr/share/vk/libnode.so" ("gcc:lib" "icu4c"))
        ("usr/share/vk/resources/app/dist/libEGL.so" ("gcc:lib"))
        ("usr/share/vk/resources/app/dist/libGLESv2.so" ("libx11" "libxcb" "gcc:lib"))
        ("usr/share/vk/resources/app/dist/libppapi_voip_swiftshader_x86_64.so" ("gcc:lib" "out"))
        ("usr/share/vk/resources/app/dist/libppapi_voip_x86_64.so" ("gcc:lib")))
      #:install-plan
      `(("etc/" "etc")
        ("usr/" "usr")
        ("usr/share/vk/libffmpeg.so" "lib/")
        ("usr/share/vk/libnode.so" "lib/")
        ("usr/share/vk/resources/app/dist/libEGL.so" "lib/")
        ("usr/share/vk/resources/app/dist/libGLESv2.so" "lib/")
        ("usr/share/vk/resources/app/dist/libppapi_voip_swiftshader_x86_64.so" "lib/")
        ("usr/share/vk/resources/app/dist/libppapi_voip_x86_64.so" "lib/"))
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
                                                      "patchelf --print-rpath usr/share/vk/vk"))
                                         (rpath (read-line rpath-pipe)))
                                    (close-pipe rpath-pipe)
                                    (invoke "patchelf" "--set-rpath"
                                            (string-append rpath ":" nss "/lib/nss")
                                            "usr/share/vk/vk"))))
                     (add-after 'install 'install-symlink
                                (lambda* (#:key outputs #:allow-other-keys)
                                  (let ((out (string-append (assoc-ref outputs "out"))))
                                    (mkdir (string-append out "/bin"))
                                    (symlink (string-append out "/usr/share/vk/vk")
                                             (string-append out "/bin/vk"))
                                    #t))))))
   (inputs
    `(("alsa-lib" ,alsa-lib)
      ("atk" ,atk)
      ("at-spi2-atk" ,at-spi2-atk)
      ("cairo" ,cairo)
      ("cups" ,cups)
      ("dbus" ,dbus)
      ("expat" ,expat)
      ;; ("ffmpeg" ,ffmpeg)
      ("fontconfig" ,fontconfig)
      ("gtk+" ,gtk+)
      ("gcc:lib" ,gcc "lib")
      ("gdk-pixbuf" ,gdk-pixbuf)
      ("glib" ,glib)
      ("icu4c" ,icu4c)
      ;; ("libnode" ,libnode)
      ("libx11" ,libx11)
      ("libxcb" ,libxcb)
      ("libxcomposite" ,libxcomposite)
      ("libxcursor" ,libxcursor)
      ("libxdamage" ,libxdamage)
      ("libxext" ,libxext)
      ("libxfixes" ,libxfixes)
      ("libxi" ,libxi)
      ("libxkbfile" ,libxkbfile)
      ("libxrandr" ,libxrandr)
      ("libxrender" ,libxrender)
      ("libxscrnsaver" ,libxscrnsaver)
      ("libxsts" ,libxtst)
      ("nss" ,nss)
      ("nspr" ,nspr)
      ("pango" ,pango)))
   (propagated-inputs
    `(("libnotify" ,libnotify)))
   (native-inputs
    `(("cpio" ,cpio)
      ("rpm" ,rpm)
      ("patchelf" ,patchelf)))
   (synopsis "Simple and Convenient Messaging App for VK")
   (description "Simple and Convenient Messaging App for VK")
   (home-page "https://vk.com/messenger")
   (supported-systems '("x86_64-linux"))
   (license (nonfree "They put MIT in the archive, but don't provide the full source"))))
