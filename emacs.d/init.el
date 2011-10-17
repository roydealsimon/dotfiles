;; M-x package-refresh-contents
;; M-x package-install RET starter-kit RET
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(
	starter-kit 
	starter-kit-lisp 
	starter-kit-js
	starter-kit-ruby 
	starter-kit-eshell	
	starter-kit-bindings
	)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

