(define-module (tmuxp)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages check)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages python-xyz))

(define-public python-libtmux
  (package
    (name "python-libtmux")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "libtmux" version))
              (sha256
               (base32
                "1c86d25gdv1h3gw2g59bi884nqcs7i7h2rjanvpfpznccrbj9a31"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (home-page "http://github.com/tmux-python/libtmux/")
    (synopsis "Typed scripting library / ORM / API wrapper for tmux")
    (description "Typed scripting library / ORM / API wrapper for tmux")
    (license license:expat)))


(define-public python-tmuxp
  (package
    (name "python-tmuxp")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "tmuxp" version))
              (sha256
               (base32
                "09gpzizjjkkh9nhyzc2bfqsybbiy93mj2dkf2nagk1g1lfj4c2qr"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs (list python-colorama python-libtmux python-pyyaml))
    (home-page "http://github.com/tmux-python/tmuxp/")
    (synopsis "tmux session manager")
    (description "tmux session manager")
    (license license:expat)))
