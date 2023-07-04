(define-module (tdlib)
  #:use-module (gnu packages messaging)
  #:use-module (guix build-system cmake)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public tdlib-1.8.14
  (package
   (inherit tdlib)
   (name "tdlib-1.8.14")
   (version "1.8.14")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/tdlib/td")
                  (commit "66234ae2537a99ec0eaf7b0857245a6e5c2d2bc9")))
            (file-name (git-file-name "tdlib" version))
            (sha256
             (base32
              "0lv19vpgv8nqzxmsgnmbg32zjkarqngh8cjhxc3hy3jj74cwkil5"))))
   (arguments '(#:tests? #f))))
