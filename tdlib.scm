(define-module (tdlib)
  #:use-module (gnu packages messaging)
  #:use-module (guix build-system cmake)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public tdlib-1.8.10
  (package
    (inherit tdlib)
    (name "tdlib-1.8.10")
    (version "1.8.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tdlib/td")
                    (commit "c8acf63e02e84f9c5053a4cef253a219dfbe870c")))
              (file-name (git-file-name "tdlib" version))
              (sha256
               (base32
                "17dkav9mjgmv844zlil8fq3m1pf221b3jv30cq1s1iw6k5k02371"))))
    (arguments '(#:tests? #f))))
