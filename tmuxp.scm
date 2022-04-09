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

(define-public python-libtmux-0.10
  (package
    (name "python-libtmux")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "libtmux" version))
       (sha256
        (base32
         "0qbbna7fkfvazhg3pr91rakkpj51cfa42kkh72aqkfhnjr4q3g68"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (home-page
     "https://github.com/tmux-python/libtmux")
    (synopsis "scripting library / orm for tmux")
    (description "scripting library / orm for tmux")
    (license license:expat)))

(define-public python-pyyaml-5.4.1
  (package
    (inherit python-pyyaml)
    (version "5.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "PyYAML" version))
       (sha256
        (base32
         "0pm440pmpvgv5rbbnm8hk4qga5a292kvlm1bh3x2nwr8pb5p8xv0"))))))

(define-public python-kaptan
  (package
    (name "python-kaptan")
    (version "0.5.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kaptan" version))
       (sha256
        (base32
         "1lix7hafsqdpdmiyihykymb1x9bp2s02ik0smzjzq8hlfdb1zg8s"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-pyyaml" ,python-pyyaml-5.4.1)))
    (arguments
     '(#:tests? #f))
    (home-page "https://github.com/emre/kaptan")
    (synopsis "Configuration manager")
    (description "Configuration manager")
    (license license:bsd-3)))

(define-public python-tmuxp
  (package
   (name "python-tmuxp")
   (version "1.9.2")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "tmuxp" version))
     (sha256
      (base32
       "0hy21qa80namd2s6zqhf1wkn7f7dpp59sbr32726nl5vi9n566fx"))))
   (build-system python-build-system)
   (arguments
    '(#:tests? #f))
   (propagated-inputs
    `(("python-click" ,python-click)
      ("python-colorama" ,python-colorama)
      ("python-kaptan" ,python-kaptan)
      ("python-libtmux" ,python-libtmux-0.10)))
   (home-page
    "https://github.com/tmux-python/tmuxp")
   (synopsis "tmux session manager")
   (description "tmux session manager")
   (license license:expat)))
