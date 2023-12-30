(define-module (difftastic-bin)
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

(define-public difftastic-bin
  (package
    (name "difftastic-bin")
    (version "0.53.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Wilfred/difftastic/releases/download/" version "/"
             "difft-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32
         "08hx8ljm67zjmnz3mrhisgzqiz5fnd856jqgsppl2i7x4vgzw9by"))))
    (build-system binary-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'binary-unpack)
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "xvzf" (assoc-ref inputs "source")))))
       #:install-plan
       `(("difft" "/bin/"))
       #:patchelf-plan
       `(("difft" ("glibc" "libgccjit" "libstdc++")))))
    (inputs
     `(("curl" ,curl)
       ("libgccjit" ,libgccjit)
       ("libstdc++" ,libstdc++)
       ("glibc" ,glibc)
       ("zlib" ,zlib)))
    (synopsis "Difftastic is a structural diff tool that compares files based on their syntax.")
    (description "Difftastic is a CLI diff tool that compares files based on their syntax, not line-by-line. Difftastic produces accurate diffs that are easier for humans to read.

@itemize
@item Understand what actually changed. Difftastic parses your code with tree-sitter. Unlike a line-oriented text diff, difftastic understands that the inner expression hasn't changed here.
@item Ignore formatting changes. Has your code formatter decided to split something over multiple lines? Difftastic can show what has actually changed.
@item Visualise wrapping changes. Have you added a wrapper? Difftastic can match the delimiters exactly.
@item Real line numbers. Do you know how to read @@ -5,6 +5,7 @@ syntax? Difftastic shows the actual line numbers from your files, both before and after.
@end itemize")
    (home-page "https://difftastic.wilfred.me.uk/")
    (license license:expat)))
