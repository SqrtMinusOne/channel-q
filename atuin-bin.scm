(define-module (atuin-bin)
  #:use-module (ice-9 string-fun)
  #:use-module (gnu packages base)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define libstdc++
  ;; Libstdc++ matching the default GCC.
  (make-libstdc++ gcc))

(define-public atuin-bin
  (package
    (name "atuin-bin")
    (version "18.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/atuinsh/atuin/releases/download/v" version
             "/atuin-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32
         "1pk8jchf6kxa01qbv3amzwwkj0fxc35yv446igc1h6z870yanj58"))))
    (build-system binary-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'binary-unpack)
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "xvzf" (assoc-ref inputs "source")
                     "--strip-components" "1"))))
       #:install-plan
       `(("atuin" "/bin/")
         ("completions/atuin.fish" "/share/fish/vendor_completions.d/")
         ("completions/atuin.bash" "/share/bash-completion/completions/")
         ("completions/_atuin" "/share/zsh/site-functions/"))
       #:patchelf-plan
       `(("atuin" ("glibc" "libgccjit" "libstdc++")))))
    (inputs
     `(("curl" ,curl)
       ("libgccjit" ,libgccjit)
       ("libstdc++" ,libstdc++)
       ("glibc" ,glibc)
       ("zlib" ,zlib)))
    (synopsis "Sync, search and backup shell history")
    (description "Atuin replaces your existing shell history with a SQLite database, and records additional context for your commands. Additionally, it provides optional and fully encrypted synchronisation of your history between machines, via an Atuin server.")
    (home-page "https://atuin.sh/")
    (license license:expat)))
