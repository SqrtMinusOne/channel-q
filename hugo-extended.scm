(define-module (hugo-extended)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public hugo-extended
  (package
    (name "hugo-extended")
    (version "0.113.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gohugoio/hugo/releases/download/v"
             version
             "/hugo_extended_"
             version
             "_Linux-64bit.tar.gz"))
       (sha256
        (base32
         "1wr3j4l5sj7l8piay71i7l99avqxna78bg033izp4v6zh7xcqjz0"))))
    (inputs
     `(("libgccjit" ,libgccjit)))
    (build-system binary-build-system)
    (arguments
     `(#:validate-runpath? #f
       #:strip-binaries? #f
       #:install-plan
       `(("hugo" "/bin/"))
       #:patchelf-plan
       `(("hugo" ("libgccjit")))
       #:phases
       (modify-phases %standard-phases
         (replace 'unpack
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "-xvzf" (assoc-ref inputs "source")))))))
    (native-inputs
     `(("gzip" ,gzip)))
    (synopsis "The world’s fastest framework for building websites.")
    (description "Hugo is a static HTML and CSS website generator
written in Go. It is optimized for speed, ease of use, and
configurability. Hugo takes a directory with content and templates and
renders them into a full HTML website.

Hugo relies on Markdown files with front matter for metadata, and you
can run Hugo from any directory. This works well for shared hosts and
other systems where you don’t have a privileged account.

Hugo renders a typical website of moderate size in a fraction of a
second. A good rule of thumb is that each piece of content renders in
around 1 millisecond.

Hugo is designed to work well for any kind of website including blogs,
tumbles, and docs.")
    (home-page "https://gohugo.io")
    (license license:asl2.0)))
