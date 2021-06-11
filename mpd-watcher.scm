(define-module (mpd-watcher)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages mpd))

(define-public mpd-watcher
  (package
   (name "mpd-watcher")
   (version "1.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/SqrtMinusOne/mpd-watcher")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0g5vxnyjaj95kiq6m04bq9qmn186xsjbzbzq0slghmnwc3mznb67"))))
   (build-system python-build-system)
   (arguments
    '(#:tests? #f
      ))
   (native-inputs
    `(("python-mpd2" ,python-mpd2)))
   (home-page "https://github.com/SqrtMinusOne/mpd-watcher/")
   (synopsis "A simple Python script to log mpd (https://www.musicpd.org/) activity in csv format.")
   (description "A simple Python script to log mpd (https://www.musicpd.org/) activity in csv format.")
   (license license:expat)))
