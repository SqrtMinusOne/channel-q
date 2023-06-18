(define-module (starship)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public starship
  (package
    (name "starship-bin")
    (version "1.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/starship/starship/releases/download/v"
             version
             "/starship-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32
         "05dn81h699jjw8q1x1kv28mlk02a3rlirm1p1xwph1j5z8a9a9np"))))
    (build-system binary-build-system)
    (arguments
     `(#:install-plan
       `(("starship" "/bin/"))
       #:patchelf-plan
       `(("starship" ("libgccjit" "glibc")))
       #:phases
       (modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "-xvzf" (assoc-ref inputs "source")))))))
    (inputs
     `(("glibc" ,glibc)
       ("libgccjit" ,libgccjit)))
    (native-inputs
     `(("gzip" ,gzip)))
    (synopsis "Starship is the minimal, blazing fast, and extremely customizable prompt for any shell!")
    (description "Starship is the minimal, blazing fast, and extremely customizable prompt for any shell!")
    (home-page "https://github.com/starship/starship")
    (license license:isc)))
