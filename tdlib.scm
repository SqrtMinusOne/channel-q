(define-module (tdlib)
  #:use-module (gnu packages messaging)
  #:use-module (guix build-system cmake)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public tdlib-1.8.16
  (package
   (inherit tdlib)
   (name "tdlib-1.8.16")
   (version "1.8.16")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/tdlib/td")
                  (commit "cde095db6c75827fe4bd237039574aad373ad96b")))
            (file-name (git-file-name "tdlib" version))
            (sha256
             (base32
              "1zzacz2mhjmc36aqdc5v8a7zdi0mi7k8hnrnpj9gii061pm4vx4v"))))
   (arguments '(#:tests? #f))))
