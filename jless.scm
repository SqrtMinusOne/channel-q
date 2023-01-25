(define-module (jless)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages xorg)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public jless-bin
  (package
    (name "jless-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PaulJuliusMartinez/jless/releases/download/v"
             version "/"
             "jless-v" version "-x86_64-unknown-linux-gnu.zip"))
       (sha256
        (base32
         "0fb9f66qc8shrsv1lffsdq78hc9cb6bddhml5zhv5bcm9pds7q2l"))))
    (build-system binary-build-system)
    (arguments
     `(#:install-plan
       `(("jless" "/bin/"))
       #:patchelf-plan
       `(("jless" ("glibc" "libxcb" "gcc:lib")))))
    (inputs
     `(("gcc:lib" ,gcc "lib")
       ("glibc" ,glibc)
       ("libxcb" ,libxcb)))
    (native-inputs
     `(("unzip" ,unzip)))
    (synopsis "jless is a command-line JSON viewer designed for reading, exploring, and searching through JSON data")
    (description "jless is a command-line JSON viewer. Use it as a replacement for whatever combination of less, jq, cat and your editor you currently use for viewing JSON files. It is written in Rust and can be installed as a single standalone binary.")
    (home-page "https://github.com/PaulJuliusMartinez/jless")
    (license license:expat)))
