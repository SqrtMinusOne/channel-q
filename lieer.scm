(define-module (lieer)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (gnu packages time)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages mail))

(define-public python-httplib20
  (package
    (name "python-httplib2")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "httplib2" version))
       (sha256
        (base32 "1p6q0qj8lii1qbjh2zggw2z9a7h25czm0b5mph37bv5w5wfnh174"))))
    (arguments
     '(#:tests? #f))
    (build-system python-build-system)
    (propagated-inputs (list python-pyparsing))
    (home-page "https://github.com/httplib2/httplib2")
    (synopsis "A comprehensive HTTP client library.")
    (description "This package provides a comprehensive HTTP client library.")
    (license license:expat)))

(define-public python-futures
  (package
    (name "python-futures")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "futures" version))
       (sha256
        (base32
         "154pvaybk9ncyb1wpcnzgd7ayvvhhzk92ynsas7gadaydbvkl0vy"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/agronholm/pythonfutures")
    (synopsis
     "Backport of the concurrent.futures package from Python 3")
    (description
     "Backport of the concurrent.futures package from Python 3")
    (license #f)))

(define-public python-googleapis-common-protos
  (package
    (name "python-googleapis-common-protos")
    (version "1.53.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "googleapis-common-protos" version))
       (sha256
        (base32
         "1x7bahcgnj4hnjb096s30ryad2iw5pv5qbgc7in1za507a8fi3m8"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(("python-protobuf" ,python-protobuf)))
    (home-page
     "https://github.com/googleapis/python-api-common-protos")
    (synopsis "Common protobufs used in Google APIs")
    (description
     "Common protobufs used in Google APIs")
    (license #f)))

(define-public python-google-api-core
  (package
    (name "python-google-api-core")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-api-core" version))
       (sha256
        (base32
         "07210db95dpnvpibin8b1whwa4vqh02yxpqhpiixgcwlsdad6907"))))
    (build-system python-build-system)
    ;; TODO fix tests?
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(
       ;; ("python-futures" ,python-futures)
       ("python-google-auth" ,python-google-auth)
       ("python-googleapis-common-protos"
        ,python-googleapis-common-protos)
       ("python-packaging" ,python-packaging)
       ("python-protobuf" ,python-protobuf)
       ("python-pytz" ,python-pytz)
       ("python-requests" ,python-requests)
       ("python-setuptools" ,python-setuptools)
       ("python-six" ,python-six)))
    (home-page
     "https://github.com/googleapis/python-api-core")
    (synopsis "Google API client core library")
    (description "Google API client core library")
    (license license:asl2.0)))

(define-public python-google-auth-httplib2
  (package
    (name "python-google-auth-httplib2")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-auth-httplib2" version))
       (sha256
        (base32
         "1b1hrhah01hx6bj3rb83iybrdwqv0bbdy63py39srv1bcgykjz50"))))
    (build-system python-build-system)
    ;; TODO fix tests?
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(("python-google-auth" ,python-google-auth)
       ("python-httplib2" ,python-httplib20)
       ("python-six" ,python-six)))
    (home-page
     "https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2")
    (synopsis
     "Google Authentication Library: httplib2 transport")
    (description
     "Google Authentication Library: httplib2 transport")
    (license license:asl2.0)))

(define-public python-google-auth
  (package
    (name "python-google-auth")
    (version "1.31.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-auth" version))
       (sha256
        (base32
         "0pnn9yfafswxk1fmgv04k85bnkdxmw9dnspk4vvacyfnqn4phkqm"))))
    (build-system python-build-system)
    ;; TODO fix tests?
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(("python-cachetools" ,python-cachetools)
       ("python-pyasn1-modules" ,python-pyasn1-modules)
       ("python-rsa" ,python-rsa)
       ("python-setuptools" ,python-setuptools)
       ("python-six" ,python-six)))
    (home-page
     "https://github.com/googleapis/google-auth-library-python")
    (synopsis "Google Authentication Library")
    (description "Google Authentication Library")
    (license license:asl2.0)))

(define-public python-uritemplate-3
  (package
    (name "python-uritemplate")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uritemplate" version))
       (sha256
        (base32
         "1bkwmgr0ia9gcn4bszs2xlvml79f0bi2s4a87xg22ky9rq8avy2s"))))
    (build-system python-build-system)
    (home-page "https://uritemplate.readthedocs.org")
    (synopsis "Library to deal with URI Templates")
    (description "@code{uritemplate} provides Python library to deal with URI
Templates.")
    ;; The software is made available under the terms of *either* of the
    ;; licenses found in LICENSE.APACHE or LICENSE.BSD.  Contributions
    ;; are made under *both* licenses (excerpt from the LICENSE file).
    (license (list license:bsd-2 license:asl2.0))))

(define-public python-google-api-python-client
  (package
    (name "python-google-api-python-client")
    (version "2.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "google-api-python-client" version))
       (sha256
        (base32
         "0np10mz2wj80gg7x8fvh1705g7yipi7gs81zzli05n4rczq78lib"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(("python-google-api-core"
        ,python-google-api-core)
       ("python-google-auth" ,python-google-auth)
       ("python-google-auth-httplib2"
        ,python-google-auth-httplib2)
       ("python-httplib2" ,python-httplib20)
       ("python-six" ,python-six)
       ("python-uritemplate" ,python-uritemplate-3)))
    (home-page
     "https://github.com/googleapis/google-api-python-client/")
    (synopsis "Google API Client Library for Python")
    (description
     "Google API Client Library for Python")
    (license license:asl2.0)))

(define-public python-oauth2client-httplib20
  (package
    (name "python-oauth2client")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "oauth2client" version))
       (sha256
        (base32
         "1irqqap2zibysf8dba8sklfqikia579srd0phm5n754ni0h59gl0"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f))
    (propagated-inputs
     (list python-httplib20 python-pyasn1 python-pyasn1-modules python-rsa
           python-six))
    (home-page "https://github.com/google/oauth2client/")
    (synopsis "OAuth 2.0 client library")
    (description "@code{python-oauth2client} provides an OAuth 2.0 client
library for Python")
    (license license:asl2.0)))

(define-public python-lieer
  (package
    (name "python-lieer")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "lieer" version))
       (sha256
        (base32
         "1nkxx1a6545xwn8qml9lm88my31hf0rqd0qra69fhfzrbc9ligxj"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs
     `(("python-google-api-python-client"
        ,python-google-api-python-client)
       ("python-notmuch" ,python-notmuch)
       ("python-oauth2client" ,python-oauth2client-httplib20)
       ("python-tqdm" ,python-tqdm)))
    (home-page "https://github.com/gauteh/lieer")
    (synopsis
     "Fast fetch and two-way tag synchronization between notmuch and GMail")
    (description
     "Fast fetch and two-way tag synchronization between notmuch and GMail")
    (license license:gpl3+)))
