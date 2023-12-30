(define-module (micromamba)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public micromamba-bin
  (package
    (name "micromamba-bin")
    (version "1.4.4-0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mamba-org/micromamba-releases/releases/download/"
             version
             "/micromamba-linux-64.tar.bz2"))
       (sha256
        (base32
         "11k91i9b0b1whzdp0my2kh2ad6g93s38rl4as2n417x085rk3mwa"))))
    (build-system binary-build-system)
    (arguments
     `(#:install-plan
       `(("bin" "/")
         ("info" "/share/"))
       #:patchelf-plan
       `(("bin/micromamba" ("glibc")))
       #:phases
       (modify-phases %standard-phases
         (delete 'binary-unpack)
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "-xvf" (assoc-ref inputs "source")))))))
    (inputs
     `(("glibc" ,glibc)))
    (native-inputs
     `(("gzip" ,gzip)))
    (synopsis "micromamba is a tiny version of the mamba package manager.")
    (description "micromamba is a tiny version of the mamba package manager. It is a statically linked C++ executable with a separate command line interface. It does not need a base environment and does not come with a default version of Python.")
    (home-page "https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html")
    (license license:bsd-3)))
