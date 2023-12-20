(define-module (whisper-cpp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages sdl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download))

(define-public whisper-cpp
  (package
    (name "whisper-cpp")
    (version "1.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/whisper.cpp/")
                    (commit "9286d3f584240ba58bd44a1bd1e85141579c78d4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0322ylm2804amis8kizasvfvfci7cmg3nzqanrq9lfa3gpkbbph5"))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ;; No tests
       #:make-flags '("CC=gcc" "SHELL_PATH=sh")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure) ;; No configure script
         (add-after 'build 'make-stream
           (lambda _ (invoke "make" "stream")))
         (replace 'install ;; Makefile doesn't provide "install"
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (rename-file "main" "whisper-cpp")
               (rename-file "bench" "whisper-cpp-bench")
               (rename-file "quantize" "whisper-cpp-quantize")
               (rename-file "server" "whisper-cpp-server")
               (rename-file "stream" "whisper-cpp-stream")
               (substitute* "models/download-ggml-model.sh"
                 (("cd \"\\$models_path\"") "")
                 (("models_path=\"\\$\\(get_script_path\\)\"") "")
                 (("wget") (which "wget"))
                 (("\\./main") "whisper-cpp")
                 (("saved in 'models/") "saved in '"))
               (install-file "models/download-ggml-model.sh" bin)
               (install-file "whisper-cpp" bin)
               (install-file "whisper-cpp-bench" bin)
               (install-file "whisper-cpp-quantize" bin)
               (install-file "whisper-cpp-server" bin)
               (install-file "whisper-cpp-stream" bin)))))))
    (synopsis "Port of OpenAI's Whisper model in C/C++ ")
    (native-inputs
     `(("coreutils-minimal" ,coreutils-minimal)
       ("wget" ,wget)
       ("grep" ,grep)
       ("gcc-toolchain" ,gcc-toolchain)
       ("sdl2" ,sdl2)))
    (license license:expat)
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (description "High-performance inference of OpenAI's Whisper automatic speech recognition (ASR) model:

@itemize
@item Plain C/C++ implementation without dependencies
@item Apple silicon first-class citizen - optimized via ARM NEON, Accelerate framework and Core ML
@item AVX intrinsics support for x86 architectures
@item VSX intrinsics support for POWER architectures
@item Mixed F16 / F32 precision
@item 4-bit and 5-bit integer quantization support
@item Low memory usage (Flash Attention)
@item Zero memory allocations at runtime
@item Runs on the CPU
@item Partial GPU support for NVIDIA via cuBLAS
@item Partial OpenCL GPU support via CLBlast
@item BLAS CPU support via OpenBLAS
@item C-style API
@end itemize")))
