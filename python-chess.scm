(define-module (python-chess)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject))

(define-public python-chess
  (package
   (name "python-chess")
   (version "1.10.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "chess" version))
     (sha256
      (base32 "0m6d7j3f5l43aqixjgw6580na73kafllnazrk7l3d92ayl2y3kdw"))))
   (build-system pyproject-build-system)
   (home-page "https://github.com/niklasf/python-chess")
   (synopsis
    "A chess library with move generation and validation, Polyglot opening book probing, PGN reading and writing, Gaviota tablebase probing, Syzygy tablebase probing, and XBoard/UCI engine communication.")
   (description
    "This package provides a chess library with move generation and validation,
Polyglot opening book probing, PGN reading and writing, Gaviota tablebase
probing, Syzygy tablebase probing, and XBoard/UCI engine communication.")
   (license license:gpl3+)))
