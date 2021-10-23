(define-module (yt-dlp)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages music)
  #:use-module (gnu packages video))

(define-public yt-dlp
  (package
    (name "yt-dlp")
    (version "2021.10.22")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/yt-dlp/yt-dlp")
             (commit version)))
       (sha256
        (base32
         "1sskcp1ka8lj5464a65dpizn2zbxlmfacj0rgshc7ki7mavr5cdy"))))
    (build-system python-build-system)
    (arguments
     ;; The problem here is that the directory for the man page and completion
     ;; files is relative, and for some reason, setup.py uses the
     ;; auto-detected sys.prefix instead of the user-defined "--prefix=FOO".
     ;; So, we need pass the prefix directly.  In addition, make sure the Bash
     ;; completion file is called 'yt-dlp' rather than
     ;; 'yt-dlp.bash-completion'.
     `(#:tests? #f ; Many tests fail. The test suite can be run with pytest.
       #:phases (modify-phases %standard-phases
                  (add-after 'unpack 'default-to-the-ffmpeg-input
                    (lambda _
                      ;; See <https://issues.guix.gnu.org/43418#5>.
                      ;; ffmpeg is big but required to request free formats
                      ;; from, e.g., YouTube so pull it in unconditionally.
                      ;; Continue respecting the --ffmpeg-location argument.
                      (substitute* "yt_dlp/postprocessor/ffmpeg.py"
                        (("\\.get\\('ffmpeg_location'\\)" match)
                         (format #f "~a or '~a'" match (which "ffmpeg"))))
                      #t))
                  (add-before 'build 'build-generated-files
                    (lambda _
                      ;; Avoid the make targets that require pandoc.
                      (invoke "make"
                              "PYTHON=python"
                              "yt-dlp"
                              ;;"yt-dlp.1"   ; needs pandoc
                              "completion-bash"
                              "completion-zsh"
                              "completion-fish")))
                  (add-before 'install 'fix-the-data-directories
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let ((prefix (assoc-ref outputs "out")))
                        (substitute* "setup.py"
                          (("'etc/")
                           (string-append "'" prefix "/etc/"))
                          (("'share/")
                           (string-append "'" prefix "/share/")))
                        #t)))
                  (add-after 'install 'install-completion
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (zsh (string-append out
                                                 "/share/zsh/site-functions")))
                        (mkdir-p zsh)
                        (copy-file "completions/zsh/_yt-dlp"
                                   (string-append zsh "/_yt-dlp"))
                        #t))))))
    (propagated-inputs
     `(("python-websockets" ,python-websockets)
       ("python-mutagen" ,python-mutagen)
       ("python-pycryptodomex" ,python-pycryptodomex)))
    (native-inputs
     `(("zip" ,zip)))
    (inputs
     `(("ffmpeg" ,ffmpeg)))
    (synopsis "A youtube-dl fork with additional features and fixes")
    (description "yt-dlp is a youtube-dl fork based on the now inactive youtube-dlc. The main focus of this project is adding new features and patches while also keeping up to date with the original project.")
    (home-page "https://github.com/yt-dlp/yt-dlp")
    (license license:public-domain)))
