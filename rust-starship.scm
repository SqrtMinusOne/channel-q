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

(define-public rust-float-cmp-0.9
  (package
    (name "rust-float-cmp")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "float-cmp" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1i799ksbq7fj9rm9m82g1yqgm6xi3jnrmylddmqknmksajylpplq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/mikedilger/float-cmp")
    (synopsis "Floating point approximate comparison traits")
    (description "Floating point approximate comparison traits")
    (license license:expat)))

(define-public rust-concolor-query-0.0.4
  (package
    (name "rust-concolor-query")
    (version "0.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "concolor-query" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1isbqpyiwblp0rglnaqzai5hav23095s82mwgi09v3xcck4rq5dd"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/rust-cli/concolor")
    (synopsis "Look up colored console capabilities")
    (description "Look up colored console capabilities")
    (license (list license:expat license:asl2.0))))

(define-public rust-concolor-control-0.0.7
  (package
    (name "rust-concolor-control")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "concolor-control" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1nplakbdb9sbd3h62d9zkan0xm1w0c7cbl3rk0iqgn405yf1213i"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-atty" ,rust-atty-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-concolor-query" ,rust-concolor-query-0.0.4))))
    (home-page "https://github.com/rust-cli/concolor")
    (synopsis "Control console coloring across all dependencies")
    (description "Control console coloring across all dependencies")
    (license (list license:expat license:asl2.0))))

(define-public rust-predicates-2
  (package
    (name "rust-predicates")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "predicates" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "05d749i3z8cbsr0899fzr2ksn8drbci4harcq82vjsj5krlagrcm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-concolor-control" ,rust-concolor-control-0.0.7)
        ("rust-difflib" ,rust-difflib-0.4)
        ("rust-float-cmp" ,rust-float-cmp-0.9)
        ("rust-itertools" ,rust-itertools-0.10)
        ("rust-normalize-line-endings" ,rust-normalize-line-endings-0.3)
        ("rust-predicates-core" ,rust-predicates-core-1)
        ("rust-regex" ,rust-regex-1)
        ("rust-yansi" ,rust-yansi-0.5))))
    (home-page "https://github.com/assert-rs/predicates-rs")
    (synopsis "An implementation of boolean-valued predicate functions.")
    (description "An implementation of boolean-valued predicate functions.")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-versions-3
  (package
    (name "rust-versions")
    (version "3.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "versions" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gica6drgqlcn5kx90i594zb93mvxksdz8xynspgbnj55jiagnaw"))))
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

(define-public rust-toml-edit-0.12
  (package
    (name "rust-toml-edit")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "toml_edit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dnl9pkzvxaz1ydpfkmz6kk2x7qc9np7q6hzz97jsm6nj0s54b8z"))))
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

(define-public rust-sha1-asm-0.5
  (package
    (name "rust-sha1-asm")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha1-asm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b7ab7f4n87pqdmbl1a5jrc2axf27pvbndsz9qiwwgxw01qlygan"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/RustCrypto/asm-hashes")
    (synopsis "Assembly implementation of SHA-1 compression function")
    (description "Assembly implementation of SHA-1 compression function")
    (license license:expat)))

(define-public rust-subtle-2
  (package
    (name "rust-subtle")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "subtle" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00b6jzh9gzb0h9n25g06nqr90z3xzqppfhhb260s1hjhh4pg7pkb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://dalek.rs/")
    (synopsis
     "Pure-Rust traits and utilities for constant-time cryptographic implementations.")
    (description
     "Pure-Rust traits and utilities for constant-time cryptographic implementations.")
    (license license:bsd-3)))

(define-public rust-crypto-common-0.1
  (package
    (name "rust-crypto-common")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "crypto-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l4q4ync13i056vjc775v0za8qh987da7yvrjj25q909cd9nngb8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-generic-array" ,rust-generic-array-0.14)
        ("rust-rand-core" ,rust-rand-core-0.6))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis "Common cryptographic traits")
    (description "Common cryptographic traits")
    (license (list license:expat license:asl2.0))))

(define-public rust-block-buffer-0.10
  (package
    (name "rust-block-buffer")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "block-buffer" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15cbh9jbcfcbbi863dlmamjka2f8l55ld915vr0b0xlf0l16mlzi"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-generic-array" ,rust-generic-array-0.14))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis "Buffer type for block processing of data")
    (description "Buffer type for block processing of data")
    (license (list license:expat license:asl2.0))))

(define-public rust-digest-0.10
  (package
    (name "rust-digest")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "digest" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16wpqnwlzx0lbnwccwikns7dq8fblcc6kma2l7xz8anlh5hdd5xn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-blobby" ,rust-blobby-0.3)
        ("rust-block-buffer" ,rust-block-buffer-0.10)
        ("rust-crypto-common" ,rust-crypto-common-0.1)
        ("rust-generic-array" ,rust-generic-array-0.14)
        ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/RustCrypto/traits")
    (synopsis "Traits for cryptographic hash functions")
    (description "Traits for cryptographic hash functions")
    (license (list license:expat license:asl2.0))))

(define-public rust-cpufeatures-0.2
  (package
    (name "rust-cpufeatures")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cpufeatures" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sgllzsvs8hinylaiigmd9c908gd8wclxnqz8dinpxbdyql981cm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/RustCrypto/utils")
    (synopsis
     "Lightweight and efficient no-std compatible alternative to the
is_x86_feature_detected! macro
")
    (description
     "Lightweight and efficient no-std compatible alternative to the
is_x86_feature_detected! macro")
    (license (list license:expat license:asl2.0))))

(define-public rust-sha-1-0.10
  (package
    (name "rust-sha-1")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sha-1" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03zag8zk4qlv40n2yryddapv5yxkam3hdr7n53d8qrzr2gali3q2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-cpufeatures" ,rust-cpufeatures-0.2)
        ("rust-digest" ,rust-digest-0.10)
        ("rust-sha1-asm" ,rust-sha1-asm-0.5))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "SHA-1 hash function")
    (description "SHA-1 hash function")
    (license (list license:expat license:asl2.0))))

(define-public rust-itoa-1
  (package
    (name "rust-itoa")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "itoa" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d8wr2qf5b25a04xf10rz9r0pdbjdgb0zaw3xvf8k2sqcz1qzaqs"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/itoa")
    (synopsis "Fast integer primitive to string conversion")
    (description "Fast integer primitive to string conversion")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1
  (package
    (name "rust-serde-json")
    (version "1.0.74")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_json" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hiixjnrnrvvpyh58av73ds924zgzi4wl0mv8p9nan0w0v6vjazf"))))
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
    (version "1.0.133")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0dym0l8a0pch0mkqnhrf89n4wngzwf0d1z88hb8dhs456acic87d"))))
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
    (version "1.0.133")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "serde" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16lq33l09nkm0hxdhfjjmh3yjv83rrcqw9lbxb8y4q3va5km0mlp"))))
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
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "semver" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04l00sn8y7lv1a8j11a6r7vwcm5qmlsdh7zqb0rw2cxab1i8x2jn"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/dtolnay/semver")
    (synopsis "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (description
     "Parser and evaluator for Cargo's flavor of Semantic Versioning")
    (license (list license:expat license:asl2.0))))

(define-public rust-os-info-3
  (package
    (name "rust-os-info")
    (version "3.0.9")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "os_info" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0am726dcqslmkkz5p0ijfvwgqy4331fn5p0s1nyxm5wdimdxb7dq"))))
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

(define-public rust-open-2
  (package
    (name "rust-open")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "open" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dq9c6dgq7iv5kvqfk8gvkfq34j5pdinfcs1hbdd4x6i62vf8vhp"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-pathdiff" ,rust-pathdiff-0.2)
        ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/Byron/open-rs")
    (synopsis "Open a path or URL using the program configured on the system")
    (description
     "Open a path or URL using the program configured on the system")
    (license license:expat)))

(define-public rust-once-cell-1
  (package
    (name "rust-once-cell")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "once_cell" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mfqhrsgi368x92bwnq3vi3p5nv0n1qlrn69gfflhvkfkxfm2cns"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
        ("rust-parking-lot" ,rust-parking-lot-0.11))))
    (home-page "https://github.com/matklad/once_cell")
    (synopsis "Single assignment cells and lazy values.")
    (description "Single assignment cells and lazy values.")
    (license (list license:expat license:asl2.0))))

(define-public rust-zvariant-derive-2
  (package
    (name "rust-zvariant-derive")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zvariant_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s9xk9c4p9vl0j2vr1abqc12mgv500sjc3fnh8ij3d1yb4i5xjp4"))))
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

(define-public rust-zvariant-2
  (package
    (name "rust-zvariant")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zvariant" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0995d59vl8409mk3qrbshqrz5d76dq52szg0x2vqji07y9app356"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-arrayvec" ,rust-arrayvec-0.5)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-enumflags2" ,rust-enumflags2-0.6)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-bytes" ,rust-serde-bytes-0.11)
        ("rust-static-assertions" ,rust-static-assertions-1)
        ("rust-zvariant-derive" ,rust-zvariant-derive-2))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "D-Bus & GVariant encoding & decoding")
    (description "D-Bus & GVariant encoding & decoding")
    (license license:expat)))

(define-public rust-zbus-macros-1
  (package
    (name "rust-zbus-macros")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus_macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "15wsqnhmbm4avazzk8bxilaqh8nff1s2m16m3ai2y2hmnb3lmrdw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-proc-macro-crate" ,rust-proc-macro-crate-0.1)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://gitlab.freedesktop.org/dbus/zbus/")
    (synopsis "proc-macros for zbus")
    (description "proc-macros for zbus")
    (license license:expat)))

(define-public rust-nix-0.20
  (package
    (name "rust-nix")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ia96wf568sksplpcxzzf2m5jj974sri93469vpnh5b1zcln3q7m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cc" ,rust-cc-1)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-memoffset" ,rust-memoffset-0.6))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-zbus-1
  (package
    (name "rust-zbus")
    (version "1.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "zbus" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11bc3d6d7565fyazsii53xy1y9zdhgn49j37vf0anjam0cykr675"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-async-io" ,rust-async-io-1)
        ("rust-byteorder" ,rust-byteorder-1)
        ("rust-derivative" ,rust-derivative-2)
        ("rust-enumflags2" ,rust-enumflags2-0.6)
        ("rust-fastrand" ,rust-fastrand-1)
        ("rust-futures" ,rust-futures-0.3)
        ("rust-nb-connect" ,rust-nb-connect-1)
        ("rust-nix" ,rust-nix-0.20)
        ("rust-once-cell" ,rust-once-cell-1)
        ("rust-polling" ,rust-polling-2)
        ("rust-scoped-tls" ,rust-scoped-tls-1)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-xml-rs" ,rust-serde-xml-rs-0.4)
        ("rust-serde-repr" ,rust-serde-repr-0.1)
        ("rust-zbus-macros" ,rust-zbus-macros-1)
        ("rust-zvariant" ,rust-zvariant-2))))
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
    (home-page "")
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
    (home-page "")
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
    (home-page "")
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
    (home-page "")
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
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "winrt-notification" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0smyrjq0s141dmzl4mxwqx7ll8sgrbbi81qasprjajh3ivxh38gd"))))
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

(define-public rust-notify-rust-4
  (package
    (name "rust-notify-rust")
    (version "4.5.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "notify-rust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b1cl4b408vwpcb4wyhw5p8ailmxmmndg21a33bzszp6cnwblvna"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-dbus" ,rust-dbus-0.9)
        ("rust-image" ,rust-image-0.23)
        ("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-mac-notification-sys" ,rust-mac-notification-sys-0.3)
        ("rust-serde" ,rust-serde-1)
        ("rust-winrt-notification" ,rust-winrt-notification-0.5)
        ("rust-zbus" ,rust-zbus-1)
        ("rust-zvariant" ,rust-zvariant-2)
        ("rust-zvariant-derive" ,rust-zvariant-derive-2))))
    (home-page "https://github.com/hoodie/notify-rust")
    (synopsis
     "Show desktop notifications (linux, bsd, mac). Pure Rust dbus client and server.")
    (description
     "Show desktop notifications (linux, bsd, mac).  Pure Rust dbus client and server.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nix-0.23
  (package
    (name "rust-nix")
    (version "0.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "nix" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1iimixk7y2qk0jswqich4mkd8kqyzdghcgy6203j8fmxmhbn71lz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-bitflags" ,rust-bitflags-1)
        ("rust-cc" ,rust-cc-1)
        ("rust-cfg-if" ,rust-cfg-if-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-memoffset" ,rust-memoffset-0.6))))
    (home-page "https://github.com/nix-rust/nix")
    (synopsis "Rust friendly bindings to *nix APIs")
    (description "Rust friendly bindings to *nix APIs")
    (license license:expat)))

(define-public rust-native-tls-0.2
  (package
    (name "rust-native-tls")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "native-tls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kdj0drgp8cqk3v430c5ac7dfpzvhm1621w96cpz985m35vrzfj8"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-libc" ,rust-libc-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-openssl-probe" ,rust-openssl-probe-0.1)
        ("rust-openssl-sys" ,rust-openssl-sys-0.9)
        ("rust-schannel" ,rust-schannel-0.1)
        ("rust-security-framework" ,rust-security-framework-2)
        ("rust-security-framework-sys" ,rust-security-framework-sys-2)
        ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/sfackler/rust-native-tls")
    (synopsis "A wrapper over a platform's native TLS implementation")
    (description
     "This package provides a wrapper over a platform's native TLS implementation")
    (license (list license:expat license:asl2.0))))

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

(define-public rust-clap-2
  (package
    (name "rust-clap")
    (version "2.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "clap" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "071q5d8jfwbazi6zhik9xwpacx5i6kb2vkzy060vhf0c3120aqd0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-atty" ,rust-atty-0.2)
        ("rust-bitflags" ,rust-bitflags-1)
        ("rust-clippy" ,rust-clippy-0.0)
        ("rust-strsim" ,rust-strsim-0.8)
        ("rust-term-size" ,rust-term-size-0.3)
        ("rust-textwrap" ,rust-textwrap-0.11)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-vec-map" ,rust-vec-map-0.8)
        ("rust-yaml-rust" ,rust-yaml-rust-0.3))))
    (home-page "https://github.com/clap-rs/clap")
    (synopsis
     "A simple to use, efficient, and full-featured Command Line Argument Parser")
    (description
     "This package provides a simple to use, efficient, and full-featured Command Line
Argument Parser")
    (license license:expat)))

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

(define-public rust-wildmatch-2
  (package
    (name "rust-wildmatch")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wildmatch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1q6l67q757a71bkzx1waja24hsvwjc7mfby177awxr7p1p98pi6n"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/becheran/wildmatch")
    (synopsis
     "Simple string matching  with questionmark and star wildcard operator.")
    (description
     "Simple string matching  with questionmark and star wildcard operator.")
    (license license:expat)))

(define-public rust-webpki-roots-0.22
  (package
    (name "rust-webpki-roots")
    (version "0.22.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki-roots" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0jbll0ys9jakrvv3l1i216bbgj7jbxr7ad2dihw28xcm7s8fnb2m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t #:cargo-inputs (("rust-webpki" ,rust-webpki-0.22))))
    (home-page "https://github.com/rustls/webpki-roots")
    (synopsis "Mozilla's CA root certificates for use with webpki")
    (description "Mozilla's CA root certificates for use with webpki")
    (license license:mpl2.0)))

(define-public rust-webpki-0.22
  (package
    (name "rust-webpki")
    (version "0.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "webpki" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1gd1gxip5kgdwmrvhj5gjxij2mgg2mavq1ych4q1h272ja0xg5gh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-ring" ,rust-ring-0.16)
        ("rust-untrusted" ,rust-untrusted-0.7))))
    (home-page "https://github.com/briansmith/webpki")
    (synopsis "Web PKI X.509 Certificate Verification.")
    (description "Web PKI X.509 Certificate Verification.")
    (license license:unlicense)))

(define-public rust-sct-0.7
  (package
    (name "rust-sct")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sct" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "193w3dg2pcn7138ab4c586pl76nkryn4h6wqlwvqj5gqr6vwsgfm"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-ring" ,rust-ring-0.16)
        ("rust-untrusted" ,rust-untrusted-0.7))))
    (home-page "https://github.com/ctz/sct.rs")
    (synopsis "Certificate transparency SCT verification library")
    (description "Certificate transparency SCT verification library")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-rustls-0.20
  (package
    (name "rust-rustls")
    (version "0.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rustls" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "111z24faq1i1z3gbznfgl7qp3in2fx1y1adijjsl1q7kj0i5wznk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-ring" ,rust-ring-0.16)
        ("rust-sct" ,rust-sct-0.7)
        ("rust-webpki" ,rust-webpki-0.22))))
    (home-page "https://github.com/rustls/rustls")
    (synopsis "Rustls is a modern TLS library written in Rust.")
    (description "Rustls is a modern TLS library written in Rust.")
    (license (list license:asl2.0 license:isc license:expat))))

(define-public rust-attohttpc-0.18
  (package
    (name "rust-attohttpc")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "attohttpc" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0wnh9krbrr1g9ky220b3i30wrisq3qwgzxqln45hfvkykali77p6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build?
       #t
       #:cargo-inputs
       (("rust-encoding-rs" ,rust-encoding-rs-0.8)
        ("rust-encoding-rs-io" ,rust-encoding-rs-io-0.1)
        ("rust-flate2" ,rust-flate2-1)
        ("rust-http" ,rust-http-0.2)
        ("rust-log" ,rust-log-0.4)
        ("rust-mime" ,rust-mime-0.3)
        ("rust-multipart" ,rust-multipart-0.18)
        ("rust-native-tls" ,rust-native-tls-0.2)
        ("rust-openssl" ,rust-openssl-0.10)
        ("rust-rustls" ,rust-rustls-0.20)
        ("rust-serde" ,rust-serde-1)
        ("rust-serde-json" ,rust-serde-json-1)
        ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
        ("rust-url" ,rust-url-2)
        ("rust-webpki" ,rust-webpki-0.22)
        ("rust-webpki-roots" ,rust-webpki-roots-0.22)
        ("rust-wildmatch" ,rust-wildmatch-2))))
    (home-page "https://github.com/sbstp/attohttpc")
    (synopsis "Small and lightweight HTTP client")
    (description "Small and lightweight HTTP client")
    (license license:mpl2.0)))

(define-public rust-starship-1
  (package
    (name "rust-starship")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "starship" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0d6f0mm72chsraa2cy191g4h9546p2ndkjvf8f4i75di27vn21n6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f
       ;; #:features '("edition2021")
       ;; #:rust ,rust-1.57
       #:cargo-inputs
       (("rust-ansi-term" ,rust-ansi-term-0.12)
        ("rust-attohttpc" ,rust-attohttpc-0.18)
        ("rust-byte-unit" ,rust-byte-unit-4)
        ("rust-chrono" ,rust-chrono-0.4)
        ("rust-clap" ,rust-clap-2)
        ("rust-directories-next" ,rust-directories-next-2)
        ("rust-gethostname" ,rust-gethostname-0.2)
        ("rust-git2" ,rust-git2-0.13)
        ("rust-indexmap" ,rust-indexmap-1)
        ("rust-log" ,rust-log-0.4)
        ("rust-native-tls" ,rust-native-tls-0.2)
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
        ("rust-toml-edit" ,rust-toml-edit-0.12)
        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
        ("rust-unicode-width" ,rust-unicode-width-0.1)
        ("rust-urlencoding" ,rust-urlencoding-2)
        ("rust-versions" ,rust-versions-3)
        ("rust-which" ,rust-which-4)
        ("rust-winapi" ,rust-winapi-0.3)
        ("rust-yaml-rust" ,rust-yaml-rust-0.4))
       #:cargo-development-inputs
       (("rust-mockall" ,rust-mockall-0.11)
        ("rust-tempfile" ,rust-tempfile-3))))
    (inputs
     `(("zlib" ,zlib)
       ("pkg-config" ,pkg-config)
       ("openssl" ,openssl)))
    (home-page "https://starship.rs")
    (synopsis
     "The minimal, blazing-fast, and infinitely customizable prompt for any shell! â\x98\x84ð\x9f\x8c\x8cï¸\x8f
")
    (description
     "The minimal, blazing-fast, and infinitely customizable prompt for any shell!
â\x98\x84ð\x9f\x8c\x8cï¸\x8f")
    (license license:isc)))
