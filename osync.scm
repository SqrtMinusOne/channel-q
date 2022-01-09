(define-module (osync)
  #:use-module ((guix licenses) #:prefix licenses:)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages rsync))

(define-public osync
  (package
    (name "osync")
    (version "1.3-beta3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deajan/osync/")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zpxypgfj6sr87wq6s237fr2pxkncjb0w9hq14zfjppkvws66n0w"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:validate-runpath? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-file-names
           (lambda _
             ;; Silence beta warining. Otherwise the exitcode is not zero
             (substitute* "osync.sh" (("IS_STABLE=false") "IS_STABLE=true"))))
         (delete 'bootstrap)
         (delete 'configure)
         (delete 'build)
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (string-append (assoc-ref outputs "out"))))
               ;; Use system* because installer returns exitcode 2 because it doesn't find systemd or initrc
               (system* "./install.sh" (string-append "--prefix=" out) "--no-stats")
               (mkdir (string-append out "/bin"))
               (symlink (string-append out "/usr/local/bin/osync.sh")
                        (string-append out "/bin/osync.sh"))
               (symlink (string-append out "/usr/local/bin/osync-batch.sh")
                        (string-append out "/bin/osync-batch.sh"))
               (symlink (string-append out "/usr/local/bin/ssh-filter.sh")
                        (string-append out "/bin/ssh-filter.sh"))
               #t))))))
    ;; TODO replace the executables with full paths
    ;; XXX Can't put "iputils" in propagated-inputs because on Guix
    ;; "ping" is in setuid-programs. Set "REMOTE_HOST_PING" to false if ping
    ;; is not available.
    (propagated-inputs
     `(("rsync" ,rsync)
       ("gawk" ,gawk)
       ("coreutils" ,coreutils)
       ("openssh" ,openssh)
       ("gzip" ,gzip)
       ("hostname" ,inetutils)))
    (synopsis "A robust two way (bidirectional) file sync script based on rsync with fault tolerance, POSIX ACL support, time control and near realtime sync")
    (home-page "http://www.netpower.fr/osync")
    (license licenses:bsd-3)
    (description "A two way filesync script running on bash Linux, BSD, Android, MacOSX, Cygwin, MSYS2, Win10 bash and virtually any system supporting bash). File synchronization is bidirectional, and can be run manually, as scheduled task, or triggered on file changes in daemon mode. It is a command line tool rsync wrapper with a lot of additional features baked in.")))
