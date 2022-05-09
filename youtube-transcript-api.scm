(define-module (youtube-transcript-api)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-web))

(define-public python-youtube-transcript-api
  (package
    (name "python-youtube-transcript-api")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "youtube_transcript_api" version))
       (sha256
        (base32 "1xhbivz2m8fyznsmq8k8i133lidjqm4kjgnlq3drbzkx73hnj3fa"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs (list python-requests))
    (home-page "https://github.com/jdepoix/youtube-transcript-api")
    (synopsis
     "This is an python API which allows you to get the transcripts/subtitles for a given YouTube video. It also works for automatically generated subtitles, supports translating subtitles and it does not require a headless browser, like other selenium based solutions do!")
    (description
     "This is an python API which allows you to get the transcripts/subtitles for a
given YouTube video.  It also works for automatically generated subtitles,
supports translating subtitles and it does not require a headless browser, like
other selenium based solutions do!")
    (license license:expat)))
