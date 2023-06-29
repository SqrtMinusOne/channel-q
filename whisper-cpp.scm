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
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/whisper.cpp/")
                    (commit "85ed71aaec8e0612a84c0b67804bde75aa75a273")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1gfjx5s1mz3ja5x1v3hx1p76v9xz5kd7c8n0p6hihkgmx1gl2p3y"))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f ;; No tests
       #:make-flags '("CC=gcc" "SHELL_PATH=sh")
       #:phases
       (modify-phases %standard-phases
         (delete 'configure) ;; No configure script
         (replace 'install ;; Makefile doesn't provide "install"
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
               (rename-file "main" "whisper-cpp")
               (rename-file "bench" "whisper-cpp-bench")
               (rename-file "quantize" "whisper-cpp-quantize")
               (substitute* "models/download-ggml-model.sh"
                 (("cd \"\\$models_path\"") "")
                 (("models_path=\"\\$\\(get_script_path\\)\"") "")
                 (("wget") (which "wget"))
                 (("\\./main") "whisper-cpp")
                 (("saved in 'models/") "saved in '"))
               (install-file "models/download-ggml-model.sh" bin)
               (install-file "whisper-cpp" bin)
               (install-file "whisper-cpp-bench" bin)
               (install-file "whisper-cpp-quantize" bin)))))))
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
