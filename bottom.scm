(define-module (bottom)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages xorg)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public bottom-bin
  (package
    (name "bottom-bin")
    (version "0.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ClementTsang/bottom/releases/download/"
             version "/bottom_x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32
         "1hzgdk8xpdnsz3v4jrj91d9rdicmc521xkjflv0fc3farf9fl32q"))))
    (build-system binary-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'binary-unpack)
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "xvzf" (assoc-ref inputs "source")))))
       #:install-plan
       `(("btm" "/bin/")
         ("completion/_btm" "/share/zsh/site-functions/")
         ("completion/btm.bash" "/share/bash-completion/completions/")
         ("completion/btm.fish" "/share/fish/vendor_completions.d/"))
       #:patchelf-plan
       `(("btm" ("glibc" "libgccjit")))))
    (inputs
     `(("libgccjit" ,libgccjit)
       ("glibc" ,glibc)))
    (native-inputs
     `(("gzip" ,gzip)))
    (synopsis "Yet another cross-platform graphical process/system monitor. ")
    (description "A customizable cross-platform graphical process/system monitor for the terminal.  Inspired by gtop, gotop, and htop.")
    (home-page "https://github.com/ClementTsang/bottom")
    (license license:expat)))
