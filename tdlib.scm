(define-module (tdlib)
  #:use-module (gnu packages messaging)
  #:use-module (guix build-system cmake)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public tdlib-1.8.15
  (package
   (inherit tdlib)
   (name "tdlib-1.8.15")
   (version "1.8.15")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/tdlib/td")
                  (commit "53888437cf11aca258aae7e76552a38c1750d6e7")))
            (file-name (git-file-name "tdlib" version))
            (sha256
             (base32
              "0wia0s5ff12pf9d07psm8h8x5y2prsv8kmd240yg5s4xpcr8a3wi"))))
   (arguments '(#:tests? #f))))
