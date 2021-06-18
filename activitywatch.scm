(define-module (activitywatch)
  #:use-module (gnu packages compression)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public activitywatch
  (package
   (name "activitywatch-bin")
   (version "0.11.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://github.com/ActivityWatch/activitywatch/releases/download/v"
           version
           "/activitywatch-v"
           version
           "-linux-x86_64.zip"))
     (sha256
      (base32
       "1w62s9y8z6yn2mv55npsg1rfi2az4lim62v4awxwq1xzx4249pi0"))))
   (build-system binary-build-system)
   (arguments
    `(#:validate-runpath? #f
      #:install-plan
      `(("." "/usr/share/activitywatch"))
      #:patchelf-plan
      `(("aw-qt" ("zlib"))
        ("aw-server/aw-server" ("zlib"))
        ("aw-server-rust/aw-server-rust" ("zlib"))
        ("aw-watcher-afk/aw-watcher-afk" ("zlib"))
        ("aw-watcher-window/aw-watcher-window" ("zlib")))
      #:phases
      (modify-phases %standard-phases
                     (add-after 'install 'install-symlink
                                (lambda* (#:key outputs #:allow-other-keys)
                                  (let ((out (string-append (assoc-ref outputs "out"))))
                                    (mkdir (string-append out "/bin"))
                                    (symlink (string-append out "/usr/share/activitywatch/aw-server/aw-server")
                                             (string-append out "/bin/aw-server"))
                                    (symlink (string-append out "/usr/share/activitywatch/aw-server-rust/aw-server-rust")
                                             (string-append out "/bin/aw-server-rust"))
                                    (symlink (string-append out "/usr/share/activitywatch/aw-watcher-afk/aw-watcher-afk")
                                             (string-append out "/bin/aw-watcher-afk"))
                                    (symlink (string-append out "/usr/share/activitywatch/aw-watcher-window/aw-watcher-window")
                                             (string-append out "/bin/aw-watcher-window"))
                                    #t))))))
   (inputs
    `(("zlib" ,zlib)))
   (native-inputs
    `(("unzip" ,unzip)))
   (synopsis "ActivityWatch is an app that automatically tracks how you spend time on your devices.")
   (description "ActivityWatch is an app that automatically tracks how you spend time on your devices.

It is open source, privacy-first, cross-platform, and a great alternative to services like RescueTime, ManicTime, and WakaTime.

It can be used to keep track of your productivity, time spent on different projects, bad screen habits, or just to understand how you spend your time.")
   (home-page "https://activitywatch.net/")
   (license license:mpl2.0)))
