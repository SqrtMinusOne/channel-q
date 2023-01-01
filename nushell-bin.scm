(define-module (nushell-bin)
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

(define-public nushell-bin
  (package
    (name "nushell-bin")
    (version "0.73.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nushell/nushell/releases/download/" version "/"
             "nu-" version "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32
         "1k4jz4hcplvizpn38bww4za4vpffap1klndndinv3jx40yrdysgj"))))
    (build-system binary-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (mkdir-p "nushell")
             (invoke "tar" "xvzf" (assoc-ref inputs "source") "-C" "nushell" "--strip-components" "1"))))
       #:install-plan
       `(("nushell" "/bin/" #:exclude ("README.txt" "LICENSE")))
       #:patchelf-plan
       `(("nushell/nu" ("glibc" "zlib" "gcc:lib"))
         ("nushell/nu_plugin_custom_values" ("glibc" "gcc:lib"))
         ("nushell/nu_plugin_example" ("glibc" "gcc:lib"))
         ("nushell/nu_plugin_gstat" ("glibc" "gcc:lib" "zlib"))
         ("nushell/nu_plugin_inc" ("glibc" "gcc:lib"))
         ("nushell/nu_plugin_query" ("glibc" "gcc:lib")))))
    (inputs
     `(("curl" ,curl)
       ("gcc:lib" ,gcc "lib")
       ("libgit2" ,libgit2)
       ("libx11" ,libx11)
       ("libxcb" ,libxcb)
       ("openssl" ,openssl)
       ("glibc" ,glibc)
       ("zlib" ,zlib)))
    (synopsis "Shell that understands the structure of the data")
    (description "Nu draws inspiration from projects like PowerShell, functional
programming languages, and modern CLI tools. Rather than thinking of
files and services as raw streams of text, Nu looks at each input as
something with structure. For example, when you list the contents of
a directory, what you get back is a table of rows, where each row
represents an item in that directory. These values can be piped
through a series of steps, in a series of commands called a
``pipeline''.")
    (home-page "https://www.nushell.sh")
    (license license:expat)))
