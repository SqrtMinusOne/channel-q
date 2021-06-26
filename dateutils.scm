(define-module (dateutils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages bison))

(define-public clitoris
  (package
   (name "clitoris")
   (version "0.2.6")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/hroptatyr/clitoris")
                  (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "05qgb38xa5bvrkl2hs2m71lrczgkqg8sz80ypyy6vfnps6wydclg"))))
   (build-system gnu-build-system)
   (license license:expat)
   (home-page "http://www.fresse.org/clitoris/")
   (arguments
    `(#:tests? #f))
   (native-inputs
    `(("autoconf" ,autoconf)
      ("libtool" ,libtool)
      ("automake" ,automake)
      ("texinfo" ,texinfo)))
   (synopsis "command-line interface testing on regular input syntax ")
   (description "A command-line tool to run automated tests for command-line applications. Much like expect but with a syntax that actually resembles the command-lines you'd be otherwise executing in the shell.")))


(define-public dateutils
  (package
   (name "dateutils")
   (version "0.4.8")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/hroptatyr/dateutils")
                  (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "03bdycalcwknzdhynhlhjac6hq24k3557x03p0w1l9bvn8iypvjn"))))
   (build-system gnu-build-system)
   (license license:expat)
   (home-page "http://www.fresse.org/dateutils/")
   (arguments
    `(#:tests? #f
      ;; #:phases
      ;; (modify-phases %standard-phases
      ;;                (add-before 'check 'fix-test-links
      ;;                            (lambda* (#:key outputs #:allow-other-keys)
      ;;                              (map (lambda (file)
      ;;                                     (map (lambda (program)
      ;;                                            (substitute* file
      ;;                                                         ((program)
      ;;                                                          (string-append (getcwd) "/src/" program))))
      ;;                                          '("dgrep" "strptime" "dzone" "dadd" "dtest" "ddiff" "dconv" "dseq" "dsort" "dround")))
      ;;                                   (find-files "./test" "\\.clit$"))
      ;;                              #t)))
      ))
   (native-inputs
    `(("gperf" ,gperf)
      ("flex" ,flex)
      ("bison" ,bison)
      ("autoconf" ,autoconf)
      ("libtool" ,libtool)
      ("automake" ,automake)
      ("texinfo" ,texinfo)
      ("clitoris" ,clitoris)))
   (synopsis "nifty command line date and time utilities; fast date calculations and conversion in the shell")
   (description "Dateutils are a bunch of tools that revolve around fiddling with dates and times on the command line with a strong focus on use cases that arise when dealing with large amounts of financial data.

Dateutils commands are prefixed with a date but otherwise resemble known unix commands for reasons of intuition. The only exception being strptime which is analogous to the libc function of the same name.

@itemize
@item strptime Command line version of the C function
@item dateadd Add durations to dates or times
@item dateconv Convert dates or times between calendars
@item datediff Compute durations between dates or times
@item dategrep Grep dates or times in input streams
@item dateround Round dates or times to \"fuller\" values
@item dateseq Generate sequences of dates or times
@item datesort Sort chronologically.
@item datetest Compare dates or times
@item datezone Convert date/times to timezones in bulk
@end itemize")))
