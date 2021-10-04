(define-module (i3-switch-tabs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages crates-io)
  #:use-module (guix git-download))

(define-public rust-i3ipc-0.10
  (package
    (name "rust-i3ipc")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "i3ipc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zljiin4s8d5ci18f87v5yinji10299z651irf4awgs71k0dmwv3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1))))
    (home-page "https://github.com/tmerr/i3ipc-rs")
    (synopsis "A library for controlling i3-wm through its IPC interface")
    (description
     "This package provides a library for controlling i3-wm through its IPC interface")
    (license license:expat)))

(define-public rust-i3-switch-tabs
  (package
    (name "rust-i3-switch-tabs")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nikola-kocic/i3-switch-tabs.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "09w2i2z3inyz3aw316gwaaw9pqf7gpjdxl57al0610j9bpjsaw7m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-i3ipc" ,rust-i3ipc-0.10)
        ("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/nikola-kocic/i3-switch-tabs")
    (synopsis "Switch top-level tabs in i3-wm ")
    (description
     "Switch top-level tabs in i3-wm. Requires i3wm version 4.8 or newer.")
    (license license:expat)))
