(define-module (sunwait)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download))

(define-public sunwait
  (package
   (name "sunwait")
   (version "1.0.0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/risacher/sunwait")
                  (commit "102cb417ecbb7a3757ba9ee4b94d6db3225124c4")))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0cs8rdcnzsl10zia2k49a6c2z6gvp5rnf31sgn3hn5c7kgy7l3ax"))))
   (build-system gnu-build-system)
   (arguments
    '(#:tests? #f ;; No tests
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure) ;; No configure script
                     (replace 'install ;; Makefile doesn't provide "install"
                              (lambda* (#:key outputs #:allow-other-keys)
                                (let ((bin (string-append (assoc-ref outputs "out")
                                                          "/bin")))
                                  (install-file "sunwait" bin)))))))
   (synopsis "Sunwait calculates sunrise or sunset times with civil, nautical, astronomical and custom twilights, for use with Windows Task Scheduler or 'cron' on Linux")
   (license gpl3)
   (home-page "https://github.com/risacher/sunwait")
   (description "Sunwait calculates sunrise or sunset times with civil, nautical, astronomical and custom twilights.

Features:
- Calculates sunrise and sunset for given coordinates
- Can wait for sunrise/sunset, or return DAY or NIGHT codes
- Works with Windows Task Scheduler (or cron)
- Supports custom twilight angles
- Used to automate domestic lighting with Arduino transmitter and radio controlled sockets")))
