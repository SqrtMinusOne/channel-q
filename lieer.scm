(define-module (lieer)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages time)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages mail))

(define-public python-google-api-python-client
  (package
    (name "python-google-api-python-client")
    (version "2.114.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-api-python-client" version))
       (sha256
        (base32 "1vb52i6w5swfsv8ikfnc3kdh8pq3c134pmp9h492d0p6c2zvnhg0"))))
    (build-system pyproject-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs (list python-google-api-core python-google-auth
                             python-google-auth-httplib2 python-httplib2
                             python-uritemplate))
    (home-page "https://github.com/googleapis/google-api-python-client/")
    (synopsis "Google API Client Library for Python")
    (description "Google API Client Library for Python")
    (license license:asl2.0)))

(define-public python-lieer
  (package
    (name "python-lieer")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lieer" version))
       (sha256
        (base32 "18ljyhyphasv0vvm7nlsadk8dp59hkrcjnnjq4y36d6h5nska308"))))
    (build-system pyproject-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs (list python-google-api-python-client
                             python-google-auth-oauthlib python-notmuch2
                             python-tqdm))
    (home-page "https://github.com/gauteh/lieer")
    (synopsis
     "Fast fetch and two-way tag synchronization between notmuch and GMail")
    (description
     "Fast fetch and two-way tag synchronization between notmuch and GMail")
    (license #f)))
