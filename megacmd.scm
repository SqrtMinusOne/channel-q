(define-module (megacmd)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages check)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls))

(define-public megacmd
  (package
   (name "megacmd-1.4")
   (version "1.4.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/meganz/MEGAcmd")
           (commit (string-append version "_Linux"))
           (recursive? #t)))
     (sha256
      (base32
       "11wc8jpkqdy4g9zb5m24akiqzj22sf3mbnbgzm0006ng6i49jm23"))
     (file-name (git-file-name name version))))
   (build-system gnu-build-system)
   ;; XXX: Disabling tests because they depend on libgtest.la from googletest,
   ;; which is not installed for unclear reasons.
   (arguments
    `(#:tests? #f
      #:configure-flags '("--with-pcre")))
   (native-inputs
    `(("autoconf" ,autoconf)
      ("automake" ,automake)
      ("libtool" ,libtool)))
   (inputs
    `(("c-ares" ,c-ares)
      ("crypto++" ,crypto++)
      ("curl" ,curl)
      ("freeimage" ,freeimage)
      ("gtest" ,googletest)
      ("openssl" ,openssl)
      ("pcre" ,pcre)
      ("readline" ,readline)
      ("sodium" ,libsodium)
      ("sqlite3" ,sqlite)
      ("zlib" ,zlib)))
   (home-page "https://mega.nz/cmd")
   (synopsis
    "Command Line Interactive and Scriptable Application to access mega.nz")
   (description "MEGAcmd provides non UI access to MEGA services.  It intends
to offer all the functionality of a MEGA account via commands.  It features
synchronization, backup of local folders into a MEGA account and a
webdav/streaming server.

See also: megatools, a third-party alternative more commonly packaged in other
distributions.")
   (license (list license:bsd-2 license:gpl3+))))
