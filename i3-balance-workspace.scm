(define-module (i3-balance-workspace)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz))

(define-public python-i3ipc
  (package
    (name "python-i3ipc")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "i3ipc" version))
       (sha256
        (base32 "1s6crkdn7q8wmzl5d0pb6rdkhhbvp444yxilrgaylnbr2kbxg078"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs `(("python-xlib" ,python-xlib)))
    (home-page "https://github.com/altdesktop/i3ipc-python")
    (synopsis "An improved Python library to control i3wm and sway")
    (description "An improved Python library to control i3wm and sway")
    (license license:bsd-3)))

(define-public python-i3-balance-workspace
  (package
    (name "python-i3-balance-workspace")
    (version "1.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "i3-balance-workspace" version))
       (sha256
        (base32 "0ypm9agwq73dkh6gh08aw0rh841v6jxjaj28b2h7i67pasvp4pbv"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))                    ; No tests available
    (propagated-inputs `(("python-i3ipc" ,python-i3ipc)))
    (home-page "https://github.com/atreyasha/i3-balance-workspace")
    (synopsis "Balance windows and workspaces in i3wm")
    (description "Balance windows and workspaces in i3wm")
    (license license:expat)))
