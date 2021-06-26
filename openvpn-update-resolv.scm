(define-module (openvpn-update-resolv)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages dns))

(define-public openvpn-update-resolve-conf
  (package
   (name "openvpn-update-resolve-conf")
   (version "20200326")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/alfredopalhares/openvpn-update-resolv-conf")
                  (commit "028849116a0691352a5458c7b0f8bdfd9980b443")))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1x2idhn532n0y3879a6cmk9l44bg0njxkxv68zscwdncw84mfbbs"))))
   (build-system gnu-build-system)
   (arguments
    '(#:tests? #f
      #:phases
      (modify-phases %standard-phases
                     (delete 'bootstrap)
                     (delete 'configure)
                     (delete 'build)
                     (replace 'install
                              (lambda* (#:key outputs #:allow-other-keys)
                                (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                                  (substitute* "update-resolv-conf.sh"
                                               (("RESOLVCONF=.*")
                                                (format #f "RESOLVCONF=~s\n" (which "resolvconf"))))
                                  (substitute* "update-resolv-conf.sh"
                                               (("cut") (which "cut")))
                                  (install-file "update-resolv-conf.sh" bin)))))))
   (inputs
    `(("openresolv" ,openresolv)
      ("coreutils" ,coreutils)))
   (synopsis "Script that updates DNS settings are pushed by the OpenVPN server")
   (home-page "https://github.com/alfredopalhares/openvpn-update-resolv-conf")
   (license license:gpl2)
   (description "This is a script to update your /etc/resolv.conf with DNS settings that come from the received push dhcp-options. Since network management is out of OpenVPN client scope, this script adds and removes the provided from those settings.")))
