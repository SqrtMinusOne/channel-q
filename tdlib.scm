(define-module (tdlib)
  #:use-module (gnu packages messaging)
  #:use-module (guix build-system cmake)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download))

(define-public tdlib-1.8.13
  (package
   (inherit tdlib)
   (name "tdlib-1.8.13")
   (version "1.8.13")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/tdlib/td")
                  (commit "c95598e5e1493881d31211c1329bdbe4630f6136")))
            (file-name (git-file-name "tdlib" version))
            (sha256
             (base32
              "0h435zh4wylzvxd6chzjawa9zibmnnza8nf01zqbaywfg17vpcbp"))))
   (arguments '(#:tests? #f))))
