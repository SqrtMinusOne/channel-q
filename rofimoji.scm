(define-module (rofimoji)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages python-xyz))

(define-public python-rofimoji
  (package
    (name "python-rofimoji")
    (version "5.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rofimoji" version))
       (sha256
        (base32 "069r74yndrndab95xivccn6g1filfzv702yhcnrsjnw7nzv3kmrj"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (delete 'check)
         (add-before 'build 'make-setup-py
           (lambda* _
             (with-output-to-file "setup.py"
               (lambda _
                 (format #t
                         "
from setuptools import setup

setup(
    name='rofimoji',
    version='5.3.0',
    description='Simple character picker using rofi',
    author='fdw',
    author_email='5821180+fdw@users.noreply.github.com',
    url='https://github.com/fdw/rofimoji',
    license='MIT',
    classifiers=[
        'License :: OSI Approved :: MIT License'
    ],

    package_dir={'': 'src'},
    packages=['picker'],
    package_data={
        'picker': ['data/*.csv']
    },
    entry_points={
        'console_scripts': [
            'rofimoji = picker.rofimoji:main'
        ]
    },
    install_requires=[
        'ConfigArgParse>0.15,<2.0.0'
    ],
    data_files=[
        ('share/man/man1', ['src/picker/docs/rofimoji.1'])
    ]
)"
                         ))))))))
    (propagated-inputs
     `(("python-configargparse" ,python-configargparse)
       ("xclip" ,xclip)
       ("xdotool" ,xdotool)
       ("wl-clipboard" ,wl-clipboard)))
    (home-page "https://github.com/fdw/rofimoji")
    (synopsis "Simple character picker using rofi")
    (description "Simple character picker using rofi")
    (license license:expat)))
