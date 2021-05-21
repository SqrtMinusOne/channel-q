(define-module (dt-colorscripts)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download))

(define-public dt-colorscripts
  (package
   (name "dt-colorscripts")
   (version "1.0.0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://gitlab.com/dwt1/shell-color-scripts")
                  (commit "3f4eff838b6340206a17665e8f925136f87f4a2d")))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0cvksyvbwqh5y3fbz9j54y56488mxq47l0ymz3g10yad30sn8pk3"))))
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
                                (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                                      (man (string-append (assoc-ref outputs "out") "/share/man/man1"))
                                      (opt (string-append (assoc-ref outputs "out") "/opt")))
                                  (substitute* "colorscript.sh"
                                               (("DIR_COLORSCRIPTS=.*")
                                                (format #f "DIR_COLORSCRIPTS=~s\n" (string-append opt "/colorscripts"))))
                                  (rename-file "colorscript.sh" "colorscript")
                                  (install-file "colorscript" bin)
                                  (install-file "colorscript.1" man)
                                  (copy-recursively "colorscripts" (string-append opt "/colorscripts"))))))))
   (synopsis "A collection of terminal color scripts DT has accumulated over the years")
   (home-page "https://gitlab.com/dwt1/shell-color-scripts")
   (license isc)
   (description "A collection of terminal color scripts I've accumulated over the years.
Included 52 beautiful terminal color scripts.")))
