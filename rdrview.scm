(define-module (rdrview)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public rdrview
  (package
    (name "rdrview")
    (version "20210913")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eafer/rdrview")
                    (commit "9bde19f9e53562790b363bb2e3b15707c8c67676")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1w6gam1gqyxwyyvr7b7bghxwdx27min849ksjz4p4q4bdglmi8p3"))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ;; No tests
       #:make-flags (list (string-append "DESTDIR=" (assoc-ref %outputs "out"))
                          "PREFIX=/")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure) ;; No configure script
         )))
    (synopsis "Firefox Reader View as a command line tool")
    (propagated-inputs
     `(("libxml2" ,libxml2)
       ("libseccomp" ,libseccomp)
       ("curl" ,curl)))
    (license license:asl2.0)
    (home-page "https://github.com/eafer/rdrview")
    (description "Command line tool to extract the main content from a webpage, as done by the \"Reader View\" feature of most modern browsers. It's intended to be used with terminal RSS readers, to make the articles more readable on web browsers such as lynx. The code is closely adapted from the Firefox version and the output is expected to be mostly equivalent.")))
