(define-module (rust-starship)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics))

(define-public rust-mockall-derive-0.11
  (package
    (name "rust-mockall-derive")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mockall_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sxavgqr9m6xh68fibfrh7jb4vfw9j86xqi14bvs7pm012121vvr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/asomers/mockall")
    (synopsis "Procedural macros for Mockall
")
    (description "Procedural macros for Mockall")
    (license (list license:expat license:asl2.0))))

(define-public rust-downcast-0.11
  (package
    (name "rust-downcast")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "downcast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wa78ahlc57wmqyq2ncr80l7plrkgz57xsg7kfzgpcnqac8gld8l"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/fkoep/downcast-rs")
    (synopsis
     "Trait for downcasting trait objects back to their original types.")
    (description
     "Trait for downcasting trait objects back to their original types.")
    (license license:expat)))

(define-public rust-mockall-0.11
  (package
    (name "rust-mockall")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mockall" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f6nscx90jkj4vza3ck8ldn2cs6savdm0qxibmr75ybjk9ip0k9x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-downcast" ,rust-downcast-0.11)
        ("rust-fragile" ,rust-fragile-1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-mockall-derive" ,rust-mockall-derive-0.11)
        ("rust-predicates" ,rust-predicates-2)
        ("rust-predicates-tree" ,rust-predicates-tree-1))))
    (home-page "https://github.com/asomers/mockall")
    (synopsis "A powerful mock object library for Rust.
")
    (description
     "This package provides a powerful mock object library for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-which-4
  (package
    (name "rust-which")
    (version "4.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "which" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ln1wmhb6k3al9zhbw8rzidr1imni55ajr3840hg474jgr47wnia"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-either" ,rust-either-1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/harryfei/which-rs.git")
    (synopsis
     "A Rust equivalent of Unix command \"which\". Locate installed executable in cross platforms.")
    (description
     "This package provides a Rust equivalent of Unix command \"which\".  Locate
installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-minimal-lexical-0.2
  (package
    (name "rust-minimal-lexical")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "minimal-lexical" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/Alexhuszagh/minimal-lexical")
    (synopsis "Fast float parsing conversion routines.")
    (description "Fast float parsing conversion routines.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nom-7
  (package
    (name "rust-nom")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0281jdx0xcyhjgs1jkj9pii8py1clcpazg41bgz7d71qxzhi278v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2)
        ("rust-minimal-lexical" ,rust-minimal-lexical-0.2)
        ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/Geal/nom")
    (synopsis "A byte-oriented, zero-copy, parser combinators library")
    (description
     "This package provides a byte-oriented, zero-copy, parser combinators library")
    (license license:expat)))

(define-public rust-versions-4
  (package
    (name "rust-versions")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "versions" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1m04qvig0av1fz36082kyaln5rlndzrj70g0az6f3pck2wanq9ym"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-itertools" ,rust-itertools-0.10)
        ("rust-nom" ,rust-nom-7)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/fosskers/rs-versions")
    (synopsis "A library for parsing and comparing software version numbers.")
    (description
     "This package provides a library for parsing and comparing software version
numbers.")
    (license license:expat)))

(define-public rust-urlencoding-2
  (package
    (name "rust-urlencoding")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "urlencoding" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08cq5w84imxrpyifhmx719026dzjih29gdq0ncsb1fcs08qhkfb8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://lib.rs/urlencoding")
    (synopsis "A Rust library for doing URL percentage encoding.")
    (description
     "This package provides a Rust library for doing URL percentage encoding.")
    (license license:expat)))

(define-public rust-unicode-segmentation-1
  (package
    (name "rust-unicode-segmentation")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-segmentation" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16gxxda9aya0arcqs9aa9lb31b3i54i34dmyqi6j5xkpszsj123y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/unicode-rs/unicode-segmentation")
    (synopsis
     "This crate provides Grapheme Cluster, Word and Sentence boundaries
according to Unicode Standard Annex #29 rules.
")
    (description
     "This crate provides Grapheme Cluster, Word and Sentence boundaries according to
Unicode Standard Annex #29 rules.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kstring-1
  (package
    (name "rust-kstring")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kstring" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09j5xb3rnjd3kmc2v667wzsc4mz4c1hl1vkzszbj30fyxb60qccb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/cobalt-org/kstring")
    (synopsis "Key String: optimized for map keys")
    (description "Key String: optimized for map keys")
    (license (list license:expat license:asl2.0))))

(define-public rust-combine-4
  (package
    (name "rust-combine")
    (version "4.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "combine" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qihymj493vvs054gzpcmp4lzb098zrj2p9miv19yzvrrjm2gdsh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytes" ,rust-bytes-0.5)
        ("rust-bytes" ,rust-bytes-1)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-io" ,rust-futures-io-0.3)
        ("rust-memchr" ,rust-memchr-2)
        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
        ("rust-regex" ,rust-regex-1)
        ("rust-tokio" ,rust-tokio-1)
        ("rust-tokio" ,rust-tokio-0.3)
        ("rust-tokio" ,rust-tokio-0.2)
        ("rust-tokio-util" ,rust-tokio-util-0.6))))
    (home-page "https://github.com/Marwes/combine")
    (synopsis
     "Fast parser combinators on arbitrary streams with zero-copy support.")
    (description
     "Fast parser combinators on arbitrary streams with zero-copy support.")
    (license license:expat)))

(define-public rust-toml-edit-0.13
  (package
    (name "rust-toml-edit")
    (version "0.13.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml_edit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nzmc02sfkkxsg59gjqsg0irwn5mj5lp2cz0gjj0ld2jngarwkkl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-combine" ,rust-combine-4)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-kstring" ,rust-kstring-1)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/ordian/toml_edit")
    (synopsis "Yet another format-preserving TOML parser.")
    (description "Yet another format-preserving TOML parser.")
    (license (list license:expat license:asl2.0))))

(define-public rust-terminal-size-0.1
  (package
    (name "rust-terminal-size")
    (version "0.1.17")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "terminal_size" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1pq60ng1a7fjp597ifk1cqlz8fv9raz9xihddld1m1pfdia1lg33"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/eminence/terminal-size")
    (synopsis "Gets the size of your Linux or Windows terminal")
    (description "Gets the size of your Linux or Windows terminal")
    (license (list license:expat license:asl2.0))))

(define-public rust-sys-info-0.9
  (package
    (name "rust-sys-info")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sys-info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0b759814ng0cj5a1iiqqjgrzfg9vqlpkbp6z3l76mycbp850sfhb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1) ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/FillZpp/sys-info-rs")
    (synopsis
     "Get system information in Rust.

For now it supports Linux, Mac OS X, illumos, Solaris, FreeBSD, OpenBSD, and Windows.
")
    (description
     "Get system information in Rust.

For now it supports Linux, Mac OS X, illumos, Solaris, FreeBSD, OpenBSD, and
Windows.")
    (license license:expat)))

(define-public rust-starship-battery-0.7
  (package
    (name "rust-starship-battery")
    (version "0.7.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "starship-battery" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p819qlmlh2qg3iw3w7qf12q29icar74zgk9mr3l9bq4s251jdik"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-core-foundation" ,rust-core-foundation-0.7)
        ("rust-lazycell" ,rust-lazycell-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-mach" ,rust-mach-0.3)
        ("rust-nix" ,rust-nix-0.23)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-uom" ,rust-uom-0.30)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/starship/rust-battery")
    (synopsis "Cross-platform information about the notebook batteries")
    (description "Cross-platform information about the notebook batteries")
    (license license:isc)))

(define-public rust-shell-words-1
  (package
    (name "rust-shell-words")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "shell-words" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1plgwx8r0h5ismbbp6cp03740wmzgzhip85k5hxqrrkaddkql614"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/tmiasko/shell-words")
    (synopsis "Process command line according to parsing rules of UNIX shell")
    (description
     "Process command line according to parsing rules of UNIX shell")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.79")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "158xd1swdvw6y59bx4avb8vdpj727n54r77xw5f7c15kqfjrz3cf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-indexmap" ,rust-indexmap-1)
        ("rust-itoa" ,rust-itoa-1)
        ("rust-ryu" ,rust-ryu-1)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "A JSON serialization file format")
    (description "This package provides a JSON serialization file format")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-derive-1
  (package
    (name "rust-serde-derive")
    (version "1.0.136")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yb28smlymba4qbj2bn4c4myvblypqvkxv9q33s0dlzwa9qpwn88"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://serde.rs")
    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (description
     "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-1
  (package
    (name "rust-serde")
    (version "1.0.136")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12a791cbdd3gi08536i4frrqsps0ak8gvhpijvgj9rg1055y4cff"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde-derive" ,rust-serde-derive-1))))
    (home-page "https://serde.rs")
    (synopsis "A generic serialization/deserialization framework")
    (description
     "This package provides a generic serialization/deserialization framework")
    (license (list license:expat license:asl2.0))))

(define-public rust-semver-1
  (package
    (name "rust-semver")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ivj7z9yp6v46ml40nsr8aqh64fphzv5xfvkxpxni6pcja7731h4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-msvc-0.30
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wdmxdz63n0qbp3ywahxcs5y7z3firkc38f69gpqz13602gvrjh8"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.30
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0nid8amrlgbpq6ggcpj19xprxih3mzkm1q0rq6s8vm900b5lz9lc"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.30
  (package
    (name "rust-windows-i686-msvc")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19jlb6amw8rnlg71pbsbqk464hyd749iq5yv34qbfls71lx9x86l"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.30
  (package
    (name "rust-windows-i686-gnu")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f744iasfzibd9gi59c9iwd5d3vwp4pz6r0qip35cfd9kncf2i8i"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.30
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_aarch64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1jkbdfqzynwqpn3h5kl6519vmb97p6p1yz9wyrszfhnn6m27l9r9"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.30
  (package
    (name "rust-windows-sys")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16m9qq428d6aqz4m4j2ffzdv5jvk3547r834r82pmr962vwpy2q3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.30)
        ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.30)
        ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.30)
        ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.30)
        ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.30))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "Rust for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-process-control-3
  (package
    (name "rust-process-control")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "process_control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n3xhjcn5q98kq8xig7hvpwrcjbknrbg8h1j2z67bflmzgvqsp4x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-windows-sys" ,rust-windows-sys-0.30))))
    (home-page "https://github.com/dylni/process_control")
    (synopsis "Methods for ergonomically running processes with timeouts
")
    (description "Methods for ergonomically running processes with timeouts")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-info-3
  (package
    (name "rust-os-info")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os_info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h6kb5w5hw5b2anjyb45njfmqn0klrcl8bzxcz7pkx2yai6zhg82"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-serde" ,rust-serde-1)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/stanislav-tkach/os_info")
    (synopsis "Detect the operating system type and version.")
    (description "Detect the operating system type and version.")
    (license license:expat)))

(define-public rust-zvariant-derive-3
  (package
    (name "rust-zvariant-derive")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zvariant_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ypvc7hk5yrpr1151nvxgxfikc5k2p6j8fk5gwzhaahwlv2yqb4c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "D-Bus & GVariant encoding & decoding")
    (description "D-Bus & GVariant encoding & decoding")
    (license license:expat)))

(define-public rust-arrayvec-0.7
  (package
    (name "rust-arrayvec")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arrayvec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mjl8jjqxpl0x7sm9cij61cppi7yi38cdrd1l8zjw7h7qxk2v9cd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
     "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.")
    (description
     "This package provides a vector with fixed capacity, backed by an array (it can
be stored on the stack too).  Implements fixed capacity ArrayVec and
ArrayString.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zvariant-3
  (package
    (name "rust-zvariant")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zvariant" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cw03hwc03sak1zsc9hwx7hxrnj3h4w0k45plpkgln10ig1mvsj9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.7)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-enumflags2" ,rust-enumflags2-0.7)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-static-assertions" ,rust-static-assertions-1)
        ("rust-zvariant-derive" ,rust-zvariant-derive-3))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "D-Bus & GVariant encoding & decoding")
    (description "D-Bus & GVariant encoding & decoding")
    (license license:expat)))

(define-public rust-zbus-names-2
  (package
    (name "rust-zbus-names")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus_names" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qdpqkyw3nzr927n8df4s6v692mqnyqjgk1hbm8as7dphz7wvps5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-static-assertions" ,rust-static-assertions-1)
        ("rust-zvariant" ,rust-zvariant-3))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "A collection of D-Bus bus names types")
    (description "This package provides a collection of D-Bus bus names types")
    (license license:expat)))

(define-public rust-zbus-macros-2
  (package
    (name "rust-zbus-macros")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0h4019bv9n5xhibjb6hf2xs85bxc5lk07284kyqwdhyx1z0kr0in"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "proc-macros for zbus")
    (description "proc-macros for zbus")
    (license license:expat)))

(define-public rust-ordered-stream-0.0.1
  (package
    (name "rust-ordered-stream")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ordered-stream" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cfc4mgsl29ij9g27hfxlk51jcg35kdv2ldapl46xzdckq2hqqs4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
    (home-page "https://github.com/danieldg/ordered-stream")
    (synopsis "Streams that are ordered relative to external events")
    (description "Streams that are ordered relative to external events")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-sink-0.3
  (package
    (name "rust-futures-sink")
    (version "0.3.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-sink" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s58gx5yw1a21xviw2qgc0wzk225vgn4kbzddrp141m3kw9kw5i1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://rust-lang.github.io/futures-rs")
    (synopsis "The asynchronous `Sink` trait for the futures-rs library.
")
    (description "The asynchronous `Sink` trait for the futures-rs library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-enumflags2-derive-0.7
  (package
    (name "rust-enumflags2-derive")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enumflags2_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "194d20akzhyraj2dla4axcifyji6x5xwcp8jza26zaybjsacfkhl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/NieDzejkob/enumflags2")
    (synopsis
     "Do not use directly, use the reexport in the `enumflags2` crate. This allows for better compatibility across versions.")
    (description
     "Do not use directly, use the reexport in the `enumflags2` crate.  This allows
for better compatibility across versions.")
    (license (list license:expat license:asl2.0))))

(define-public rust-enumflags2-0.7
  (package
    (name "rust-enumflags2")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "enumflags2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1vsdy8aw6cqm39z0akv7kaz0nfhdxzfvwg0qrw8l3y5kasq90p52"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-enumflags2-derive" ,rust-enumflags2-derive-0.7)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/NieDzejkob/enumflags2")
    (synopsis "Enum-based bit flags")
    (description "Enum-based bit flags")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-executor-1
  (package
    (name "rust-async-executor")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-executor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0rd9sd0rksvjwx4zzy6c69qcd7bwp3z42rpiiizfnbm2w2srn7w7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-task" ,rust-async-task-4)
        ("rust-concurrent-queue" ,rust-concurrent-queue-1)
        ("rust-fastrand" ,rust-fastrand-1)
        ("rust-futures-lite" ,rust-futures-lite-1)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-slab" ,rust-slab-0.4))))
    (home-page "https://github.com/smol-rs/async-executor")
    (synopsis "Async executor")
    (description "Async executor")
    (license (list license:asl2.0 license:expat))))

(define-public rust-async-channel-1
  (package
    (name "rust-async-channel")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-channel" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06b3sq2hd8qwl2xxlc4qalg6xw3l9b41w4sym9g0q70mf93dc511"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-concurrent-queue" ,rust-concurrent-queue-1)
        ("rust-event-listener" ,rust-event-listener-2)
        ("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://github.com/smol-rs/async-channel")
    (synopsis "Async multi-producer multi-consumer channel")
    (description "Async multi-producer multi-consumer channel")
    (license (list license:asl2.0 license:expat))))

(define-public rust-futures-core-0.3
  (package
    (name "rust-futures-core")
    (version "0.3.21")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "futures-core" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lqhc6mqklh5bmkpr77p42lqwjj8gaskk5ba2p3kl1z4nw2gs28c"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://rust-lang.github.io/futures-rs")
    (synopsis "The core traits and types in for the `futures` library.
")
    (description "The core traits and types in for the `futures` library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-async-broadcast-0.3
  (package
    (name "rust-async-broadcast")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "async-broadcast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0fs7zb66aqqmaja3vryymmmiz0x035gppja6p0php3i1l6c2cqlh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-easy-parallel" ,rust-easy-parallel-3)
        ("rust-event-listener" ,rust-event-listener-2)
        ("rust-futures-core" ,rust-futures-core-0.3))))
    (home-page "https://github.com/smol-rs/async-broadcast")
    (synopsis "Async broadcast channels")
    (description "Async broadcast channels")
    (license (list license:expat license:asl2.0))))

(define-public rust-zbus-2
  (package
    (name "rust-zbus")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16jy4z8qbq9y32c0vqmxiqiyd2jgr6p455vin946mqlj8lynzf3v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-broadcast" ,rust-async-broadcast-0.3)
        ("rust-async-channel" ,rust-async-channel-1)
        ("rust-async-executor" ,rust-async-executor-1)
        ("rust-async-io" ,rust-async-io-1)
        ("rust-async-lock" ,rust-async-lock-2)
        ("rust-async-recursion" ,rust-async-recursion-0.3)
        ("rust-async-task" ,rust-async-task-4)
        ("rust-async-trait" ,rust-async-trait-0.1)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-derivative" ,rust-derivative-2)
        ("rust-enumflags2" ,rust-enumflags2-0.7)
        ("rust-event-listener" ,rust-event-listener-2)
        ("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-futures-util" ,rust-futures-util-0.3)
        ("rust-hex" ,rust-hex-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-nix" ,rust-nix-0.23)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-ordered-stream" ,rust-ordered-stream-0.0.1)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-xml-rs" ,rust-serde-xml-rs-0.4)
        ("rust-serde-repr" ,rust-serde-repr-0.1)
        ("rust-sha1" ,rust-sha1-0.6)
        ("rust-static-assertions" ,rust-static-assertions-1)
        ("rust-tokio" ,rust-tokio-1)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-zbus-macros" ,rust-zbus-macros-2)
        ("rust-zbus-names" ,rust-zbus-names-2)
        ("rust-zvariant" ,rust-zvariant-3))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "API for D-Bus communication")
    (description "API for D-Bus communication")
    (license license:expat)))

(define-public rust-xml-rs-0.8
  (package
    (name "rust-xml-rs")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "xml-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18q048wk3jafgl59sa2m0qv4vk2sqkfcya4kznc5rxqkhsad7myj"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/netvl/xml-rs")
    (synopsis "An XML library in pure Rust")
    (description "An XML library in pure Rust")
    (license license:expat)))

(define-public rust-windows-x86-64-msvc-0.24
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16fk46ri9pzfyg44gj35m6rl7i8jps89mmsrh4slcm6av1ig1n4v"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.24
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_x86_64_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i4di3s8rh9yp43qqrp7q6lfamig9a3bd4r9b8h4902q60v1fjiq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-macros-0.24
  (package
    (name "rust-windows-macros")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "13n5k0wbhqhl7f737f51wvwl2d2h2vf1kk0pmh7v4iia4qq7lr1f"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-syn" ,rust-syn-1)
        ("rust-windows-gen" ,rust-windows-gen-0.24)
        ("rust-windows-quote" ,rust-windows-quote-0.24)
        ("rust-windows-reader" ,rust-windows-reader-0.24))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Macros for the windows crate")
    (description "Macros for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.24
  (package
    (name "rust-windows-i686-msvc")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_msvc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ilmbcklljd27bzjr7crb3mlisnfmqxaplkqj2i6k4vydgazw3xz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.24
  (package
    (name "rust-windows-i686-gnu")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_i686_gnu" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1z810n1yafcmv14himqz9snfmr83pyxr0x077bbsxagclc86b1n0"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-reader-0.24
  (package
    (name "rust-windows-reader")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_reader" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "12dz2wipijzyv5cbdk8dk6bv5ngs70ij9ww1sfv2z2wrxm67ps4y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-quote-0.24
  (package
    (name "rust-windows-quote")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_quote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l5sr61bfd8rhmm509jnrmm2b95bsxsbj1wqmjrvfarym9lkx6vc"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-gen-0.24
  (package
    (name "rust-windows-gen")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows_gen" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l31985hw8p4nwrrq8zlrqyw3rcnjvdc2fcs8w2lwi108l63z2b7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-quote" ,rust-windows-quote-0.24)
        ("rust-windows-reader" ,rust-windows-reader-0.24))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Code gen support for the windows crate")
    (description "Code gen support for the windows crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-0.24
  (package
    (name "rust-windows")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "windows" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0i1ry526a8nrs3fikgl99yinlqqinjlfhzxcq1rb12hcmr2r7wx9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-windows-gen" ,rust-windows-gen-0.24)
        ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.24)
        ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.24)
        ("rust-windows-macros" ,rust-windows-macros-0.24)
        ("rust-windows-reader" ,rust-windows-reader-0.24)
        ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.24)
        ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.24))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "Rust for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-strum-macros-0.22
  (package
    (name "rust-strum-macros")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strum_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1yz9ia03p3xbndhjbcmxjifh1r43cchynzxcqx23g7jliffpk7rk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.3)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description "Helpful macros for working with enums and strings")
    (license license:expat)))

(define-public rust-strum-0.22
  (package
    (name "rust-strum")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "strum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17kjz02z1wwfw1rcfdsmsbpazngnqhz23zhwychql727gly8kb7p"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-strum-macros" ,rust-strum-macros-0.22))))
    (home-page "https://github.com/Peternator7/strum")
    (synopsis "Helpful macros for working with enums and strings")
    (description "Helpful macros for working with enums and strings")
    (license license:expat)))

(define-public rust-winrt-notification-0.5
  (package
    (name "rust-winrt-notification")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winrt-notification" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1x7djvadifkgzvkkrzyfr5mpzvaqzxibkrbkvk3f08qbhi9h6yh0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-strum" ,rust-strum-0.22)
        ("rust-windows" ,rust-windows-0.24)
        ("rust-xml-rs" ,rust-xml-rs-0.8))))
    (home-page "https://github.com/allenbenz/winrt-notification")
    (synopsis "An incomplete wrapper over the WinRT toast api")
    (description "An incomplete wrapper over the WinRT toast api")
    (license license:expat)))

(define-public rust-mac-notification-sys-0.3
  (package
    (name "rust-mac-notification-sys")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mac-notification-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xnsrr4102rbka57198v7gkfhivl54a456ax765x7758m5qnpyrx"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-dirs" ,rust-dirs-1)
        ("rust-objc-foundation" ,rust-objc-foundation-0.1))))
    (home-page "https://github.com/h4llow3En/mac-notification-sys")
    (synopsis "Thin wrapper around macOS Notifications.")
    (description "Thin wrapper around macOS Notifications.")
    (license license:expat)))

(define-public rust-tiff-0.7
  (package
    (name "rust-tiff")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "tiff" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1cp0ivmahzi2l57d5rjjbcgff71na1na3x68vwwwxdlck6760iq2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-flate2" ,rust-flate2-1)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
        ("rust-weezl" ,rust-weezl-0.1))))
    (home-page "https://github.com/image-rs/image-tiff")
    (synopsis "TIFF decoding and encoding library in pure Rust")
    (description "TIFF decoding and encoding library in pure Rust")
    (license license:expat)))

(define-public rust-rgb-0.8
  (package
    (name "rust-rgb")
    (version "0.8.31")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rgb" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wah7j52d0da3lhmzixnaljymy84a3q68yqwikcwvzg5l3wlldws"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytemuck" ,rust-bytemuck-1) ("rust-serde" ,rust-serde-1))))
    (home-page "https://lib.rs/crates/rgb")
    (synopsis
     "`struct RGB/RGBA/etc.` for sharing pixels between crates + convenience methods for color manipulation.
Allows no-copy high-level interoperability. Also adds common convenience methods and implements standard Rust traits to make `RGB`/`RGBA` pixels and slices first-class Rust objects.")
    (description
     "`struct RGB/RGBA/etc.` for sharing pixels between crates + convenience methods
for color manipulation.  Allows no-copy high-level interoperability.  Also adds
common convenience methods and implements standard Rust traits to make
`RGB`/`RGBA` pixels and slices first-class Rust objects.")
    (license license:expat)))

(define-public rust-system-deps-3
  (package
    (name "rust-system-deps")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "system-deps" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1y5xddh5hy1iyiy8m89p3001zbqsw33lhyhlfqhsyrnf478xpdvs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-anyhow" ,rust-anyhow-1)
        ("rust-cfg-expr" ,rust-cfg-expr-0.7)
        ("rust-heck" ,rust-heck-0.3)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-strum" ,rust-strum-0.21)
        ("rust-strum-macros" ,rust-strum-macros-0.21)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-version-compare" ,rust-version-compare-0.0.11))))
    (home-page "https://github.com/gdesmott/system-deps")
    (synopsis
     "Discover and configure system dependencies from declarative dependencies in Cargo.toml")
    (description
     "Discover and configure system dependencies from declarative dependencies in
Cargo.toml")
    (license (list license:expat license:asl2.0))))

(define-public rust-rav1e-0.5
  (package
    (name "rust-rav1e")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rav1e" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "006bfcmjwg0phg8gc25b1sl2ngjrb2bh1b3fd0s5gbf9nlkr8qsn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-aom-sys" ,rust-aom-sys-0.3)
        ("rust-arbitrary" ,rust-arbitrary-0.4)
        ("rust-arg-enum-proc-macro" ,rust-arg-enum-proc-macro-0.3)
        ("rust-arrayvec" ,rust-arrayvec-0.7)
        ("rust-av-metrics" ,rust-av-metrics-0.7)
        ("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-bitstream-io" ,rust-bitstream-io-1)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-cc" ,rust-cc-1)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-clap" ,rust-clap-2)
        ("rust-console" ,rust-console-0.14)
        ("rust-crossbeam" ,rust-crossbeam-0.8)
        ("rust-dav1d-sys" ,rust-dav1d-sys-0.3)
        ("rust-fern" ,rust-fern-0.6)
        ("rust-image" ,rust-image-0.23)
        ("rust-interpolate-name" ,rust-interpolate-name-0.2)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-ivf" ,rust-ivf-0.1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libfuzzer-sys" ,rust-libfuzzer-sys-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-nasm-rs" ,rust-nasm-rs-0.2)
        ("rust-noop-proc-macro" ,rust-noop-proc-macro-0.3)
        ("rust-num-derive" ,rust-num-derive-0.3)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-paste" ,rust-paste-1)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rand-chacha" ,rust-rand-chacha-0.3)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-rust-hawktracer" ,rust-rust-hawktracer-0.7)
        ("rust-rustc-version" ,rust-rustc-version-0.4)
        ("rust-scan-fmt" ,rust-scan-fmt-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-signal-hook" ,rust-signal-hook-0.3)
        ("rust-simd-helpers" ,rust-simd-helpers-0.1)
        ("rust-system-deps" ,rust-system-deps-3)
        ("rust-thiserror" ,rust-thiserror-1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-v-frame" ,rust-v-frame-0.2)
        ("rust-vergen" ,rust-vergen-3)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
        ("rust-y4m" ,rust-y4m-0.7))))
    (home-page "https://github.com/xiph/rav1e/")
    (synopsis "The fastest and safest AV1 encoder")
    (description "The fastest and safest AV1 encoder")
    (license license:bsd-2)))

(define-public rust-imgref-1
  (package
    (name "rust-imgref")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "imgref" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ra3wl5s22ffcx18inmlryqykh7qwzr0k2gdw1i84bwkdkdw1l21"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://lib.rs/crates/imgref")
    (synopsis
     "A trivial struct for interchange of 2d-dimensional pixel buffers with width, height & stride")
    (description
     "This package provides a trivial struct for interchange of 2d-dimensional pixel
buffers with width, height & stride")
    (license license:cc0)))

(define-public rust-avif-serialize-0.7
  (package
    (name "rust-avif-serialize")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "avif-serialize" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16fnqqgnjlrw5cin8zq6hrwaqpgzylyq9aivcwgb7cf3jxr8l0dw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.7))))
    (home-page "https://lib.rs/avif-serialize")
    (synopsis
     "Minimal writer for AVIF header structure (MPEG/HEIF/MIAF/ISO-BMFF)")
    (description
     "Minimal writer for AVIF header structure (MPEG/HEIF/MIAF/ISO-BMFF)")
    (license license:bsd-3)))

(define-public rust-ravif-0.8
  (package
    (name "rust-ravif")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ravif" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ac7z19fvvqad3pyv6wd67dy4y0fgh7rli5mknl4hanf08wsfbp7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-avif-serialize" ,rust-avif-serialize-0.7)
        ("rust-imgref" ,rust-imgref-1)
        ("rust-loop9" ,rust-loop9-0.1)
        ("rust-num-cpus" ,rust-num-cpus-1)
        ("rust-rav1e" ,rust-rav1e-0.5)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-rgb" ,rust-rgb-0.8))))
    (home-page "https://lib.rs/ravif")
    (synopsis
     "rav1e-based pure Rust library for encoding images in AVIF format (powers the `cavif` tool)")
    (description
     "rav1e-based pure Rust library for encoding images in AVIF format (powers the
`cavif` tool)")
    (license license:bsd-3)))

(define-public rust-simd-adler32-0.3
  (package
    (name "rust-simd-adler32")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simd-adler32" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "060b9v15s3miq06582cj2ywam92ph6xs34s62mc8az3xc4wxz98l"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/mcountryman/simd-adler32")
    (synopsis
     "A SIMD-accelerated Adler-32 rolling hash algorithm implementation.")
    (description
     "This package provides a SIMD-accelerated Adler-32 rolling hash algorithm
implementation.")
    (license license:expat)))

(define-public rust-adler-1
  (package
    (name "rust-adler")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zim79cvzd5yrkzl3nyfx0avijwgk9fqv3yrscdy1cc79ih02qpj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/jonas-schievink/adler.git")
    (synopsis "A simple clean-room implementation of the Adler-32 checksum")
    (description
     "This package provides a simple clean-room implementation of the Adler-32
checksum")
    (license (list license:bsd-0 license:expat license:asl2.0))))

(define-public rust-miniz-oxide-0.5
  (package
    (name "rust-miniz-oxide")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miniz_oxide" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10phz3ppw4p8pz4rwniy3qkw95wiq64kbvpb0l8kjcrzpka9pcnj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-adler" ,rust-adler-1)
        ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-simd-adler32" ,rust-simd-adler32-0.3))))
    (home-page "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
     "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (license (list license:expat license:zlib license:asl2.0))))

(define-public rust-png-0.17
  (package
    (name "rust-png")
    (version "0.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "png" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "14zkc73d1y51h5kp1vqdra9dpx6b1s8zal9sqf7cj5vv2y11i3wf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-crc32fast" ,rust-crc32fast-1)
        ("rust-deflate" ,rust-deflate-1)
        ("rust-miniz-oxide" ,rust-miniz-oxide-0.5))))
    (home-page "https://github.com/image-rs/image-png.git")
    (synopsis "PNG decoding and encoding library in pure Rust")
    (description "PNG decoding and encoding library in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-mp4parse-0.12
  (package
    (name "rust-mp4parse")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "mp4parse" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ppqv60qiyrnbb996gb1sik08c0j2i317llv3rrcwb1cjg3bdlk7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitreader" ,rust-bitreader-0.3)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-env-logger" ,rust-env-logger-0.8)
        ("rust-fallible-collections" ,rust-fallible-collections-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/mozilla/mp4parse-rust")
    (synopsis "Parser for ISO base media file format (mp4)")
    (description "Parser for ISO base media file format (mp4)")
    (license license:mpl2.0)))

(define-public rust-jpeg-decoder-0.2
  (package
    (name "rust-jpeg-decoder")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "jpeg-decoder" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1wf6vzgcjxlz3wzr1bv4qr81fxqz4ds9mxc78l3h08afss1b0pqh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/image-rs/jpeg-decoder")
    (synopsis "JPEG decoder")
    (description "JPEG decoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-threadpool-1
  (package
    (name "rust-threadpool")
    (version "1.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "threadpool" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1amgfyzvynbm8pacniivzq9r0fh3chhs7kijic81j76l6c5ycl6h"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-num-cpus" ,rust-num-cpus-1))))
    (home-page "https://github.com/rust-threadpool/rust-threadpool")
    (synopsis
     "A thread pool for running a number of jobs on a fixed set of worker threads.
")
    (description
     "This package provides a thread pool for running a number of jobs on a fixed set
of worker threads.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smallvec-1
  (package
    (name "rust-smallvec")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smallvec" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "10zf4fn63p2d6sx8qap3jvyarcfw563308x3431hd4c34r35gpgj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-arbitrary" ,rust-arbitrary-1) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/servo/rust-smallvec")
    (synopsis
     "'Small vector' optimization: store up to a small number of items on the stack")
    (description
     "'Small vector' optimization: store up to a small number of items on the stack")
    (license (list license:expat license:asl2.0))))

(define-public rust-lebe-0.5
  (package
    (name "rust-lebe")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lebe" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zr6g3d35h349j0dsx6722lrjws00x2d8z0sy5p9wxdhimlivzby"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/johannesvollmer/lebe")
    (synopsis
     "Tiny, dead simple, high performance endianness conversions with a generic API")
    (description
     "Tiny, dead simple, high performance endianness conversions with a generic API")
    (license license:bsd-3)))

(define-public rust-zerocopy-derive-0.3
  (package
    (name "rust-zerocopy-derive")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerocopy-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17rab2i1vwmxcr7c6r6xv55nhy41wlay0lpfcyl4vqpgh8mwiyx0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-syn" ,rust-syn-1)
        ("rust-synstructure" ,rust-synstructure-0.12))))
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/HEAD/src/lib/zerocopy/zerocopy-derive")
    (synopsis "Custom derive for traits from the zerocopy crate")
    (description "Custom derive for traits from the zerocopy crate")
    (license license:bsd-2)))

(define-public rust-zerocopy-0.6
  (package
    (name "rust-zerocopy")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zerocopy" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dpj4nd9v56wy93ahjkp95znjzj91waqvidqch8gxwdwq661hbrk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-byteorder" ,rust-byteorder-1)
        ("rust-zerocopy-derive" ,rust-zerocopy-derive-0.3))))
    (home-page
     "https://fuchsia.googlesource.com/fuchsia/+/HEAD/src/lib/zerocopy")
    (synopsis "Utilities for zero-copy parsing and serialization")
    (description "Utilities for zero-copy parsing and serialization")
    (license license:bsd-2)))

(define-public rust-half-1
  (package
    (name "rust-half")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "half" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mqbmx2m9qd4lslkb42fzgldsklhv9c4bxsc8j82r80d8m24mfza"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytemuck" ,rust-bytemuck-1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-zerocopy" ,rust-zerocopy-0.6))))
    (home-page "https://github.com/starkat99/half-rs")
    (synopsis
     "Half-precision floating point f16 and bf16 types for Rust implementing the IEEE 754-2008 standard binary16 and bfloat16 types.")
    (description
     "Half-precision floating point f16 and bf16 types for Rust implementing the IEEE
754-2008 standard binary16 and bfloat16 types.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasi-0.10
  (package
    (name "rust-wasi")
    (version "0.10.3+wasi-snapshot-preview1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wasi" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03iw4kid8y2nmshd793bsnpp2nqp24aak1rpak3v0w7ilf2f78j6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/bytecodealliance/wasi")
    (synopsis "Experimental WASI API bindings for Rust")
    (description "Experimental WASI API bindings for Rust")
    (license
     (list license:asl2.0 license:asl2.0 license:expat))))

(define-public rust-getrandom-0.2
  (package
    (name "rust-getrandom")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "getrandom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0k0bdr1dyf4n9fvnkx4fmwxhv4hgnyf55gj86v4m69fln743g3a1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-js-sys" ,rust-js-sys-0.3)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
        ("rust-wasi" ,rust-wasi-0.10)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/rust-random/getrandom")
    (synopsis
     "A small cross-platform library for retrieving random data from system source")
    (description
     "This package provides a small cross-platform library for retrieving random data
from system source")
    (license (list license:expat license:asl2.0))))

(define-public rust-nanorand-0.6
  (package
    (name "rust-nanorand")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nanorand" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n4903vzvk1ywp35x7qpf5avh4apqnjx1550w01iiakx4hsb77kj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-getrandom" ,rust-getrandom-0.2)
        ("rust-zeroize" ,rust-zeroize-1))))
    (home-page "https://github.com/Absolucy/nanorand-rs")
    (synopsis "A tiny, fast, zero-dep library for random number generation.")
    (description
     "This package provides a tiny, fast, zero-dep library for random number
generation.")
    (license license:zlib)))

(define-public rust-flume-0.10
  (package
    (name "rust-flume")
    (version "0.10.10")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "flume" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h3sjks6n8cfw32lw7g37g7cl140i5m4gxmn8vhqh09427yxl12x"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-futures-core" ,rust-futures-core-0.3)
        ("rust-futures-sink" ,rust-futures-sink-0.3)
        ("rust-nanorand" ,rust-nanorand-0.6)
        ("rust-pin-project" ,rust-pin-project-1)
        ("rust-spin" ,rust-spin-0.9))))
    (home-page "https://github.com/zesterer/flume")
    (synopsis "A blazingly fast multi-producer channel")
    (description
     "This package provides a blazingly fast multi-producer channel")
    (license (list license:asl2.0 license:expat))))

(define-public rust-crc32fast-1
  (package
    (name "rust-crc32fast")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crc32fast" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03c8f29yx293yf43xar946xbls1g60c207m9drf8ilqhr25vsh5m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1))))
    (home-page "https://github.com/srijs/rust-crc32fast")
    (synopsis "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (description "Fast, SIMD-accelerated CRC32 (IEEE) checksum computation")
    (license (list license:expat license:asl2.0))))

(define-public rust-gzip-header-1
  (package
    (name "rust-gzip-header")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gzip-header" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18lm2y96mahkmcd76pzyam2sl3v6lsl9mn8ajri9l0p6j9xm5k4m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-crc32fast" ,rust-crc32fast-1))))
    (home-page "https://github.com/oyvindln/gzip-header")
    (synopsis
     "A crate for decoding and encoding the header part of gzip files based on the gzip header
 implementation in the flate2 crate.
")
    (description
     "This package provides a crate for decoding and encoding the header part of gzip
files based on the gzip header  implementation in the flate2 crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-adler32-1
  (package
    (name "rust-adler32")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "adler32" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d7jq7jsjyhsgbhnfq5fvrlh9j0i9g1fqrl2735ibv5f75yjgqda"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
        ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
    (home-page "https://github.com/remram44/adler32-rs")
    (synopsis "Minimal Adler32 implementation for Rust.")
    (description "Minimal Adler32 implementation for Rust.")
    (license license:zlib)))

(define-public rust-deflate-1
  (package
    (name "rust-deflate")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "deflate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bs319wa9wl7pn9j6jrrxg1gaqbak581rkx210cbix0qyljpwvy8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-adler32" ,rust-adler32-1)
        ("rust-gzip-header" ,rust-gzip-header-1))))
    (home-page "https://github.com/image-rs/deflate-rs")
    (synopsis "A DEFLATE, zlib and gzip encoder written in Rust.
")
    (description
     "This package provides a DEFLATE, zlib and gzip encoder written in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-exr-1
  (package
    (name "rust-exr")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "exr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0002bzfwah2vkpd13b0jzkbfr37x1c7z1wasalncnrd4i6adpfnl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bit-field" ,rust-bit-field-0.10)
        ("rust-deflate" ,rust-deflate-1)
        ("rust-flume" ,rust-flume-0.10)
        ("rust-half" ,rust-half-1)
        ("rust-inflate" ,rust-inflate-0.4)
        ("rust-lebe" ,rust-lebe-0.5)
        ("rust-smallvec" ,rust-smallvec-1)
        ("rust-threadpool" ,rust-threadpool-1))))
    (home-page "https://github.com/johannesvollmer/exrs")
    (synopsis "Read and write OpenEXR files without any unsafe code")
    (description "Read and write OpenEXR files without any unsafe code")
    (license license:bsd-3)))

(define-public rust-dcv-color-primitives-0.4
  (package
    (name "rust-dcv-color-primitives")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "dcv-color-primitives" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0cf3hjgfid6damp7p2qnch6k64al2p81yijl293bmvkd4nlj91mm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-paste" ,rust-paste-1)
        ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://github.com/aws/dcv-color-primitives")
    (synopsis "a library to perform image color model conversion")
    (description "a library to perform image color model conversion")
    (license license:expat)))

(define-public rust-bytemuck-1
  (package
    (name "rust-bytemuck")
    (version "1.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "bytemuck" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0bvi884940pgp8a3jzx9yll8316894gfz153f1jip3f3p3k8k6a3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytemuck-derive" ,rust-bytemuck-derive-1))))
    (home-page "https://github.com/Lokathor/bytemuck")
    (synopsis "A crate for mucking around with piles of bytes.")
    (description
     "This package provides a crate for mucking around with piles of bytes.")
    (license (list license:zlib license:asl2.0 license:expat))))

(define-public rust-image-0.24
  (package
    (name "rust-image")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "image" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qcdd22nr6lrfx09spzlh634i2130d95k56ph9564b483zac6jp9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bytemuck" ,rust-bytemuck-1)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-color-quant" ,rust-color-quant-1)
        ("rust-dav1d" ,rust-dav1d-0.6)
        ("rust-dcv-color-primitives" ,rust-dcv-color-primitives-0.4)
        ("rust-exr" ,rust-exr-1)
        ("rust-gif" ,rust-gif-0.11)
        ("rust-jpeg-decoder" ,rust-jpeg-decoder-0.2)
        ("rust-mp4parse" ,rust-mp4parse-0.12)
        ("rust-num-iter" ,rust-num-iter-0.1)
        ("rust-num-rational" ,rust-num-rational-0.4)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-png" ,rust-png-0.17)
        ("rust-ravif" ,rust-ravif-0.8)
        ("rust-rgb" ,rust-rgb-0.8)
        ("rust-scoped-threadpool" ,rust-scoped-threadpool-0.1)
        ("rust-tiff" ,rust-tiff-0.7))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
     "Imaging library written in Rust. Provides basic filters and decoders for the most common image formats.")
    (description
     "Imaging library written in Rust.  Provides basic filters and decoders for the
most common image formats.")
    (license license:expat)))

(define-public rust-notify-rust-4
  (package
    (name "rust-notify-rust")
    (version "4.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "197znqqb5xar03mkhczsl4m7m9c174dwmwqlwicfglshm5ai6zin"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-dbus" ,rust-dbus-0.9)
        ("rust-image" ,rust-image-0.24)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-mac-notification-sys" ,rust-mac-notification-sys-0.3)
        ("rust-serde" ,rust-serde-1)
        ("rust-winrt-notification" ,rust-winrt-notification-0.5)
        ("rust-zbus" ,rust-zbus-2)
        ("rust-zvariant" ,rust-zvariant-3)
        ("rust-zvariant-derive" ,rust-zvariant-derive-3))))
    (home-page "https://github.com/hoodie/notify-rust")
    (synopsis
     "Show desktop notifications (linux, bsd, mac). Pure Rust dbus client and server.")
    (description
     "Show desktop notifications (linux, bsd, mac).  Pure Rust dbus client and server.")
    (license (list license:expat license:asl2.0))))

(define-public rust-local-ipaddress-0.1
  (package
    (name "rust-local-ipaddress")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "local_ipaddress" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1adg4rsxglij22v3d2c1x41al3yad7bqxaagiv3w9ys915rh98gn"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/egmkang/local_ipaddress")
    (synopsis "Get your local IP address without panic")
    (description "Get your local IP address without panic")
    (license license:expat)))

(define-public rust-indexmap-1
  (package
    (name "rust-indexmap")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "indexmap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08s2rdps98z4qggzad2cf58nx012lnznn0b5q02a9arcf93n4ai8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-autocfg" ,rust-autocfg-1)
        ("rust-hashbrown" ,rust-hashbrown-0.11)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-rustc-rayon" ,rust-rustc-rayon-0.3)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis
     "A hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys. It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index. A corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed to
indexmap.
")
    (description
     "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value pairs is
independent of the hash values of the keys.  It has the usual hash table
functionality, it preserves insertion order except after removals, and it allows
lookup of its elements by either hash table key or numerical index.  A
corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed
to indexmap.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libgit2-sys-0.12
  (package
    (name "rust-libgit2-sys")
    (version "0.12.26+1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libgit2-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "153l8nvz9p8vyd5840xi6fwblvhpn3c33jwdwsznyq4f4jcwiq8r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cc" ,rust-cc-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libssh2-sys" ,rust-libssh2-sys-0.2)
        ("rust-libz-sys" ,rust-libz-sys-1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis "Native bindings to the libgit2 library")
    (description "Native bindings to the libgit2 library")
    (license (list license:expat license:asl2.0))))

(define-public rust-git2-0.13
  (package
    (name "rust-git2")
    (version "0.13.25")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git2" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mppxyjzi69m879mwpin4d9jljanwaijlx3f5w3fdh143g62k4pj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-libgit2-sys" ,rust-libgit2-sys-0.12)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-url" ,rust-url-2))))
    (home-page "https://github.com/rust-lang/git2-rs")
    (synopsis
     "Bindings to libgit2 for interoperating with git repositories. This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.
")
    (description
     "Bindings to libgit2 for interoperating with git repositories.  This library is
both threadsafe and memory safe and allows both reading and writing git
repositories.")
    (license (list license:expat license:asl2.0))))

(define-public rust-gethostname-0.2
  (package
    (name "rust-gethostname")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "gethostname" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lals1bchjd9ghd9xqrr5cnp853rvfxmsh2cfxkd0li8jdjc3paa"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-libc" ,rust-libc-0.2) ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://codeberg.org/flausch/gethostname.rs")
    (synopsis "gethostname for all platforms")
    (description "gethostname for all platforms")
    (license license:asl2.0)))

(define-public rust-clap-complete-3
  (package
    (name "rust-clap-complete")
    (version "3.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_complete" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1hrvvw16h6gx6a87qjbw6fh313n5xzibqwnkaj5wcg01kk1v93b7"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-clap" ,rust-clap-3))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_complete")
    (synopsis "Generate shell completion scripts for your clap::App")
    (description "Generate shell completion scripts for your clap::App")
    (license (list license:expat license:asl2.0))))

(define-public rust-unicode-linebreak-0.1
  (package
    (name "rust-unicode-linebreak")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "unicode-linebreak" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0grq6bsn967q4vpifld53s7a140nlmpq5vy8ghgr73f4n2mdqlis"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-regex" ,rust-regex-1))))
    (home-page "https://github.com/axelf4/unicode-linebreak")
    (synopsis "Implementation of the Unicode Line Breaking Algorithm")
    (description "Implementation of the Unicode Line Breaking Algorithm")
    (license license:asl2.0)))

(define-public rust-openblas-src-0.9
  (package
    (name "rust-openblas-src")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "openblas-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0syy38a5bgv5mj6mb1n1zk1d6l5gqqrswvbmwkwx6h4z9wfrsql4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/blas-lapack-rs/openblas-src")
    (synopsis "The package provides a source of BLAS and LAPACK via OpenBLAS.")
    (description
     "The package provides a source of BLAS and LAPACK via OpenBLAS.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-netlib-src-0.8
  (package
    (name "rust-netlib-src")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "netlib-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04l2ggdaq0bjc64prsw2f8ddxn84m1rmpnkjb9nr0ijdpcv1zx1r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-cmake" ,rust-cmake-0.1))))
    (home-page "https://github.com/blas-lapack-rs/netlib-src")
    (synopsis "The package provides a source of BLAS and LAPACK via Netlib.")
    (description
     "The package provides a source of BLAS and LAPACK via Netlib.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-intel-mkl-tool-0.1
  (package
    (name "rust-intel-mkl-tool")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intel-mkl-tool" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1myyrxvmyij4c60w9x15npwzhlbjm8y8c94lvfsnrl5pbyakz8md"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-curl" ,rust-curl-0.4)
        ("rust-dirs" ,rust-dirs-2)
        ("rust-env-logger" ,rust-env-logger-0.7)
        ("rust-failure" ,rust-failure-0.1)
        ("rust-glob" ,rust-glob-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-pkg-config" ,rust-pkg-config-0.3)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-tar" ,rust-tar-0.4)
        ("rust-zstd" ,rust-zstd-0.5))))
    (home-page "https://github.com/rust-math/intel-mkl-src")
    (synopsis "CLI utility for redistributiing Intel(R) MKL")
    (description "CLI utility for redistributiing Intel(R) MKL")
    (license license:expat)))

(define-public rust-intel-mkl-src-0.5
  (package
    (name "rust-intel-mkl-src")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "intel-mkl-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "155q49a7nfbq1lllchsyx8jv2q2pijrjh1w08awvrbjyfcxb6q3j"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-intel-mkl-tool" ,rust-intel-mkl-tool-0.1))))
    (home-page "https://github.com/rust-math/intel-mkl-src")
    (synopsis "Redistribution of Intel(R) MKL as a crate")
    (description "Redistribution of Intel(R) MKL as a crate")
    ;; XXX actuall proprietary :9
    (license license:expat)))

(define-public rust-accelerate-src-0.3
  (package
    (name "rust-accelerate-src")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accelerate-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17fiqyq7f9k41pbsyrvk9pxyx9z6fw399wq036cvwkbmb14xcpj1"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/blas-lapack-rs/accelerate-src")
    (synopsis
     "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
    (description
     "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-blas-src-0.6
  (package
    (name "rust-blas-src")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "blas-src" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a134wadi4rslfqk4mafi6y7bbvacjh12x87621w4vyc3dni6px2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-accelerate-src" ,rust-accelerate-src-0.3)
        ("rust-intel-mkl-src" ,rust-intel-mkl-src-0.5)
        ("rust-netlib-src" ,rust-netlib-src-0.8)
        ("rust-openblas-src" ,rust-openblas-src-0.9))))
    (home-page "https://github.com/blas-lapack-rs/blas-src")
    (synopsis "The package provides a BLAS source of choice.")
    (description "The package provides a BLAS source of choice.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-ndarray-0.14
  (package
    (name "rust-ndarray")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "ndarray" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "011wqzmrd9gpfcfvy1xfbskqfiahn96pmi2d0r9x34d682amq3bc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-approx" ,rust-approx-0.4)
        ("rust-blas-src" ,rust-blas-src-0.6)
        ("rust-cblas-sys" ,rust-cblas-sys-0.1)
        ("rust-matrixmultiply" ,rust-matrixmultiply-0.2)
        ("rust-num-complex" ,rust-num-complex-0.3)
        ("rust-num-integer" ,rust-num-integer-0.1)
        ("rust-num-traits" ,rust-num-traits-0.2)
        ("rust-rawpointer" ,rust-rawpointer-0.2)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-ndarray/ndarray")
    (synopsis
     "An n-dimensional array for general elements and for numerics. Lightweight array views and slicing; views support chunking and splitting.")
    (description
     "An n-dimensional array for general elements and for numerics.  Lightweight array
views and slicing; views support chunking and splitting.")
    (license (list license:expat license:asl2.0))))

(define-public rust-smawk-0.3
  (package
    (name "rust-smawk")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "smawk" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hv0q1mw1r1brk7v3g4a80j162p7g1dri4bdidykrakzfqjd4ypn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-ndarray" ,rust-ndarray-0.14))))
    (home-page "https://github.com/mgeisler/smawk")
    (synopsis "Functions for finding row-minima in a totally monotone matrix.")
    (description
     "This package provides functions for finding row-minima in a totally monotone
matrix.")
    (license license:expat)))

(define-public rust-hyphenation-commons-0.8
  (package
    (name "rust-hyphenation-commons")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation_commons" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gq59h9h8597k04yl53an0j56cvb0in98pxpp27dkiz5mnifgssz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-fst" ,rust-fst-0.4) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/tapeinosyne/hyphenation")
    (synopsis "Proemial code for the `hyphenation` library")
    (description "Proemial code for the `hyphenation` library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fst-0.4
  (package
    (name "rust-fst")
    (version "0.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "fst" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06mnksicgv9rp8b7w0ykkshf355l05zym3ygm74qr5z30ndmpf3s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-utf8-ranges" ,rust-utf8-ranges-1))))
    (home-page "https://github.com/BurntSushi/fst")
    (synopsis
     "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).
")
    (description
     "Use finite state transducers to compactly represents sets or maps of many
strings (> 1 billion is possible).")
    (license (list license:unlicense license:expat))))

(define-public rust-hyphenation-0.8
  (package
    (name "rust-hyphenation")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hyphenation" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1w2hib167vpz7jbg3zs92ifihj4akirlhb5509aib1df8i6dvx5w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bincode" ,rust-bincode-1)
        ("rust-bincode" ,rust-bincode-1)
        ("rust-fst" ,rust-fst-0.4)
        ("rust-fst" ,rust-fst-0.4)
        ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
        ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
        ("rust-pocket-resources" ,rust-pocket-resources-0.3)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
    (home-page "https://github.com/tapeinosyne/hyphenation")
    (synopsis "Knuth-Liang hyphenation for a variety of languages")
    (description "Knuth-Liang hyphenation for a variety of languages")
    (license (list license:asl2.0 license:expat))))

(define-public rust-textwrap-0.14
  (package
    (name "rust-textwrap")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "textwrap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "106xjfzfpk3nj51fx9slf9kyir7xjwvpqm003v9ardgq5b8whrh0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-hyphenation" ,rust-hyphenation-0.8)
        ("rust-smawk" ,rust-smawk-0.3)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
        ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/mgeisler/textwrap")
    (synopsis
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (description
     "Powerful library for word wrapping, indenting, and dedenting strings")
    (license license:expat)))

(define-public rust-uniquote-3
  (package
    (name "rust-uniquote")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uniquote" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gqwq3kbzdsj5qsc8jfm5v4qwzgnp4rrfvdpm71ch1593h22y664"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dylni/uniquote")
    (synopsis "Quote strings for clear display in output
")
    (description "Quote strings for clear display in output")
    (license (list license:expat license:asl2.0))))

(define-public rust-print-bytes-0.5
  (package
    (name "rust-print-bytes")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "print_bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d4i9y3jx1chi6w97a8rgdbwm9g3cppr53rw53zl6fcaq31qx0b6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/dylni/print_bytes")
    (synopsis "Print bytes as losslessly as possible
")
    (description "Print bytes as losslessly as possible")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-str-bytes-6
  (package
    (name "rust-os-str-bytes")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os_str_bytes" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0r5z5xds2wzzqlqjaw96dpjsz5nqyzc1rflm4mh09aa32qyl88lf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-memchr" ,rust-memchr-2)
        ("rust-print-bytes" ,rust-print-bytes-0.5)
        ("rust-uniquote" ,rust-uniquote-3))))
    (home-page "https://github.com/dylni/os_str_bytes")
    (synopsis
     "Utilities for converting between byte sequences and platform-native strings
")
    (description
     "Utilities for converting between byte sequences and platform-native strings")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-derive-3
  (package
    (name "rust-clap-derive")
    (version "3.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11daqrx6asa985qr3mcjw11h4p8akwx6p44bvlh1rcs477f344cs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.4)
        ("rust-proc-macro-error" ,rust-proc-macro-error-1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
    (synopsis
     "Parse command line argument by defining a struct, derive crate.")
    (description
     "Parse command line argument by defining a struct, derive crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-clap-3
  (package
    (name "rust-clap")
    (version "3.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qpcwh0gz47s98b8n68x7nzysxqg0zb9ngx2ibn72g1v2qzxqgmn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-backtrace" ,rust-backtrace-0.3)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-clap-derive" ,rust-clap-derive-3)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-os-str-bytes" ,rust-os-str-bytes-6)
        ("rust-regex" ,rust-regex-1)
        ("rust-strsim" ,rust-strsim-0.10)
        ("rust-termcolor" ,rust-termcolor-1)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-textwrap" ,rust-textwrap-0.14)
        ("rust-unicase" ,rust-unicase-2)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license (list license:expat license:asl2.0))))

(define-public rust-byte-unit-4
  (package
    (name "rust-byte-unit")
    (version "4.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "byte-unit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0zxfqic18j1byrxhn7msqbywzx2sp9izs89zksaadmy71rdzqvwm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-serde" ,rust-serde-1)
        ("rust-utf8-width" ,rust-utf8-width-0.1))))
    (home-page "https://magiclen.org/byte-unit")
    (synopsis "A library for interaction with units of bytes.")
    (description
     "This package provides a library for interaction with units of bytes.")
    (license license:expat)))

(define-public rust-starship-1
  (package
    (name "rust-starship")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "starship" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08p8nhdd7yzrm0f68yw5rkng4q7j117hv375g7d6bbv6s876wr24"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-byte-unit" ,rust-byte-unit-4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-clap" ,rust-clap-3)
        ("rust-clap-complete" ,rust-clap-complete-3)
        ("rust-directories-next" ,rust-directories-next-2)
        ("rust-gethostname" ,rust-gethostname-0.2)
        ("rust-git2" ,rust-git2-0.13)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-local-ipaddress" ,rust-local-ipaddress-0.1)
        ("rust-log" ,rust-log-0.4)
        ("rust-nix" ,rust-nix-0.23)
        ("rust-notify-rust" ,rust-notify-rust-4)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-open" ,rust-open-2)
        ("rust-os-info" ,rust-os-info-3)
        ("rust-path-slash" ,rust-path-slash-0.1)
        ("rust-pest" ,rust-pest-2)
        ("rust-pest-derive" ,rust-pest-derive-2)
        ("rust-process-control" ,rust-process-control-3)
        ("rust-quick-xml" ,rust-quick-xml-0.22)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-rayon" ,rust-rayon-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-rust-ini" ,rust-rust-ini-0.17)
        ("rust-semver" ,rust-semver-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-sha-1" ,rust-sha-1-0.10)
        ("rust-shadow-rs" ,rust-shadow-rs-0.8)
        ("rust-shadow-rs" ,rust-shadow-rs-0.8)
        ("rust-shell-words" ,rust-shell-words-1)
        ("rust-starship-battery" ,rust-starship-battery-0.7)
        ("rust-starship-module-config-derive"
         ,rust-starship-module-config-derive-0.2)
        ("rust-strsim" ,rust-strsim-0.10)
        ("rust-sys-info" ,rust-sys-info-0.9)
        ("rust-terminal-size" ,rust-terminal-size-0.1)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-toml-edit" ,rust-toml-edit-0.13)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-urlencoding" ,rust-urlencoding-2)
        ("rust-versions" ,rust-versions-4)
        ("rust-which" ,rust-which-4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs
       (("rust-mockall" ,rust-mockall-0.11)
        ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://starship.rs")
    (inputs
     `(("zlib" ,zlib)
       ("pkg-config" ,pkg-config)
       ("openssl" ,openssl)))
    (synopsis
     "The minimal, blazing-fast, and infinitely customizable prompt for any shell! â\x98\x84ð\x9f\x8c\x8cï¸\x8f
")
    (description
     "The minimal, blazing-fast, and infinitely customizable prompt for any shell!
â\x98\x84ð\x9f\x8c\x8cï¸\x8f")
    (license license:isc)))
