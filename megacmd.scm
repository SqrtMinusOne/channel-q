(define-module (megacmd)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages sync))

(define-public megacmd-1.4
  (package
   (inherit megacmd)
   (name "megacmd-1.4")
   (version "1.4.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/meganz/MEGAcmd")
           (commit (string-append version "_Linux"))
           (recursive? #t)))
     (sha256
      (base32
       "11wc8jpkqdy4g9zb5m24akiqzj22sf3mbnbgzm0006ng6i49jm23"))
     (file-name (git-file-name name version))))))
