(define-module (rofi-emoji)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages xdisorg))

(define-public rofi-emoji
  (package
    (name "rofi-emoji")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mange/rofi-emoji")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "01f9nw54mbwlj00mclf7qc2y95riaihzznbbmp0wc4c52pvxki4q"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases (modify-phases %standard-phases
                  (add-after 'unpack 'fix-rofi-plugin-dir
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((out (string-append (assoc-ref outputs "out"))))
                        (substitute* "configure.ac"
                          (("\\[rofi_PLUGIN_INSTALL_DIR\\]=.*")
                           (format #f "[rofi_PLUGIN_INSTALL_DIR]=\"~a/lib/rofi\"\n" out)))))))))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)
       ("automake" ,automake)))
    (inputs
     `(("cairo" ,cairo)
       ("glib" ,glib)
       ("libnotify" ,libnotify)
       ("rofi" ,rofi)
       ("wl-clipboard" ,wl-clipboard)
       ("xsel" ,xsel)
       ("xclip" ,xclip)))
    (synopsis "Emoji selector plugin for Rofi")
    (description "An emoji selector plugin for Rofi that copies the selected emoji to the clipboard.")
    (home-page "https://github.com/Mange/rofi-emoji")
    (license license:expat)))
