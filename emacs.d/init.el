;; M-x package-refresh-contents
;; M-x package-install RET starter-kit RET
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(
	;auto-complete-octave
	;inf-ruby ; requires ruby-mode-1.1
        ; rinari_snap ; TODO: ruby-mode http://rinari.rubyforge.org/
        ac-slime
	auto-complete
	buffer-move
	color-theme
	durendal
	elein
	full-ack
	multi-term
	scratch
	slime
	slime-repl
	smex
	starter-kit
	starter-kit-bindings
	starter-kit-eshell
	starter-kit-js
	starter-kit-lisp
	starter-kit-ruby
	undo-tree
	yasnippet
        clojure-mode
        clojure-test-mode
        clojurescript-mode
        markdown-mode
        marmalade
;        oddmuse
;        scpaste
;        tuareg
        yaml-mode
        js2-mode
        nxml ; http://www.youtube.com/watch?v=kmZvVUgX1Ko
        coffee-mode
        haml-mode
        sass-mode
        flymake-coffee
        flymake-cursor
        flymake-haml
;        flymake-jslint ; FIX
        flymake-ruby
        flymake-sass
        flymake-shell
        )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))



;; Create a variable to store the path to this dotfile directory
;; (Usually ~/.emacs.d)
(setq dotfiles-dir (file-name-directory
                   (or (buffer-file-name) load-file-name)))

;; Create variables to store the path to this dotfile dir's lib etc and tmp directories
(setq dotfiles-lib-dir (concat dotfiles-dir "lib/"))
(setq dotfiles-tmp-dir (concat dotfiles-dir "tmp/"))
(setq dotfiles-etc-dir (concat dotfiles-dir "etc/"))
(setq dotfiles-config-dir (concat dotfiles-dir "config/"))
(setq dotfiles-config-themes-dir (concat dotfiles-dir "config/themes/"))
(setq dotfiles-themes-dir (concat dotfiles-dir "themes/"))

;; Create helper fns for loading dotfile paths and files
(defun add-dotfile-path (p)
  (add-to-list 'load-path (concat dotfiles-dir p)))
(defun add-lib-path (p)
  (add-to-list 'load-path (concat dotfiles-lib-dir p)))
(defun add-themes-path (p)
  (add-to-list 'load-path (concat dotfiles-themes-dir p)))

(defun load-dotfile (f)
  (load-file (concat dotfiles-dir f)))
(defun load-config (f)
  (load-file (concat dotfiles-config-dir f)))
(defun load-themes (f)
  (load-file (concat dotfiles-themes-dir f)))
(defun load-themes-config (f)
  (load-file (concat dotfiles-config-themes-dir f)))


;; Ensure these directories are on the load path
(add-dotfile-path "lib")
(add-lib-path "ibuffer-git")
(add-lib-path "mk-project")
(add-lib-path "rspec-mode")
(add-lib-path "zencoding")

(require 'buffer-move)        ; C-S <arrows>
(require 'custom-ruby)
(require 'dircolors)          ; colorize directories in C-x f
(require 'ibuffer-git)
(require 'linkd)
(require 'mk-project)
(require 'mwe-log-commands)   ; M-x mwe-open-log-commands
(require 'quick-jump)
(require 'rainbow-delimiters)
(require 'rainbow-parens)
(require 'rcodetools)
(require 'scratch)            ; scratch buffers in same mode as current buffer
(require 'smooth-scrolling)   ; freezes the cursor 1/3rd up/down the screen
(require 'toggle)
(require 'tramp)
(require 'rspec-mode)         ; http://www.emacswiki.org/emacs/RspecMode
(require 'zencoding-mode)     ; https://github.com/rooney/zencoding

(load-config "ack-conf.el")
(load-config "auto-complete-conf.el")
(load-config "auto-modes-conf.el")
(load-config "backup-conf.el")
(load-config "built-in.el")
;(load-config "cedet-conf.el")           ; TODO: set up for C
(load-config "clojure-conf.el")         ; deps - rainbows, align-cljlet
(load-config "cut-n-paste-conf.el")
(load-config "durendal-conf.el")
(load-config "flymake-conf.el")
(load-config "erc-growl-conf.el")
(load-config "highlight-flash-conf.el") ; flash s-expr on eval
(load-config "ido-conf.el")
(load-config "lisps-conf.el")
(load-config "markdown-conf.el")
(load-config "multi-term-conf.el")
(load-config "osx-conf.el")
(load-config "paredit-conf.el")
(load-config "ruby-conf.el")
(load-config "shell-conf.el")
(load-config "slime-conf.el")
(load-config "smex-conf.el")           ; M-x enhancement (like ido for commands)
(load-config "undo-tree-conf.el")
(load-config "util-fns.el")   ; TODO
(load-config "whitespace.el")
(load-config "window-number-conf.el")
(load-config "windows-conf.el")
(load-config "yasnippet-conf.el")
;(load-config "custom-faces.el") ; FIX: light
;(load-config "nxml-conf.el") ; FIX: vars
(load-config "ibuffer-conf.el")

(load-config "theme.el")
(load-config "bindings.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
