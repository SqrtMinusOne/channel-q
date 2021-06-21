(define-module (postman)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpio)
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

(define-public postman
  (package
   (name "postman")
   (version "8.6.2")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://dl.pstmn.io/download/version/" version "/linux64"))
            (sha256
             (base32
              "0jcvm5yxpsl6pn8z61lyb5rw8i1m4vgcry23b776yylmfy32kf42"))))
   (build-system binary-build-system)
   (arguments
    `(#:validate-runpath? #f ;; fails on the shipped .so files
      #:patchelf-plan
      `(("app/_Postman"
         ("out"
          "alsa-lib"
          "at-spi2-atk"
          "at-spi2-core"
          "atk"
          "cairo"
          "cups"
          "dbus"
          "expat"
          "fontconfig"
          "freetype"
          "gcc:lib"
          "gdk-pixbuf"
          "glib"
          "gtk+"
          "libdrm"
          "libx11"
          "libxcb"
          "libxcomposite"
          "libxcursor"
          "libxdamage"
          "libxext"
          "libxfixes"
          "libxi"
          "libxrandr"
          "libxrender"
          "libxscrnsaver"
          "libxtst"
          "mesa"
          "nspr"
          "pango"
          "util-linux:lib"))
        ("app/chrome-sandbox" ())
        ("app/libffmpeg.so" ("gcc:lib"))
        ("app/libEGL.so" ("gcc:lib"))
        ("app/libGLESv2.so" ("libx11" "libxcb" "gcc:lib" "libxext"))
        ("app/libvk_swiftshader.so" ("gcc:lib"))
        ("app/libvulkan.so" ("gcc:lib")))
      #:install-plan
      `(("app/" "usr/share/postman/")
        ("app/libffmpeg.so" "lib/")
        ("app/libEGL.so" "lib/")
        ("app/libGLESv2.so" "lib/")
        ("app/libvk_swiftshader.so" "lib/")
        ("app/libvulkan.so" "lib/"))
      #:phases
      (modify-phases %standard-phases
                     ;; because NSS stores its libraries in lib/nss
                     (add-after 'patchelf 'patchelf-nss
                                (lambda* (#:key inputs #:allow-other-keys)
                                  (use-modules (ice-9 popen))
                                  (use-modules (ice-9 rdelim))
                                  (let* ((nss (assoc-ref inputs "nss"))
                                         (rpath-pipe (open-input-pipe
                                                      "patchelf --print-rpath app/_Postman"))
                                         (rpath (read-line rpath-pipe)))
                                    (close-pipe rpath-pipe)
                                    (invoke "patchelf" "--set-rpath"
                                            (string-append rpath ":" nss "/lib/nss")
                                            "app/_Postman"))))
                     (add-after 'install 'install-symlink
                                (lambda* (#:key outputs #:allow-other-keys)
                                  (let ((out (string-append (assoc-ref outputs "out"))))
                                    (mkdir (string-append out "/bin"))
                                    (symlink (string-append out "/usr/share/postman/Postman")
                                             (string-append out "/bin/Postman"))
                                    #t))))))
   (inputs
    `(("alsa-lib" ,alsa-lib)
      ("at-spi2-atk" ,at-spi2-atk)
      ("at-spi2-core" ,at-spi2-core)
      ("atk" ,atk)
      ("cairo" ,cairo)
      ("cups" ,cups)
      ("dbus" ,dbus)
      ("expat" ,expat)
      ("fontconfig" ,fontconfig)
      ("freetype" ,freetype)
      ("gcc:lib" ,gcc "lib")
      ("gdk-pixbuf" ,gdk-pixbuf)
      ("glib" ,glib)
      ("gtk+" ,gtk+)
      ("libdrm" ,libdrm)
      ("libx11" ,libx11)
      ("libxcb" ,libxcb)
      ("libxcomposite" ,libxcomposite)
      ("libxcursor" ,libxcursor)
      ("libxdamage" ,libxdamage)
      ("libxext" ,libxext)
      ("libxfixes" ,libxfixes)
      ("libxi" ,libxi)
      ("libxrandr" ,libxrandr)
      ("libxrender" ,libxrender)
      ("libxscrnsaver" ,libxscrnsaver)
      ("libxtst" ,libxtst)
      ("mesa" ,mesa)
      ("nspr" ,nspr)
      ("nss" ,nss)
      ("pango" ,pango)
      ("util-linux:lib" ,util-linux "lib")))
   (native-inputs
    `(("patchelf" ,patchelf)))
   (synopsis "Postman is a collaboration platform for API development. Postman's features simplify each step of building an API and streamline collaboration so you can create better APIs—faster.")
   (description "Postman is a collaboration platform for API development. Postman's features simplify each step of building an API and streamline collaboration so you can create better APIs—faster.")
   (home-page "https://postman.com/")
   (supported-systems '("x86_64-linux"))
   (license (nonfree "Nowhere to be found"))))
