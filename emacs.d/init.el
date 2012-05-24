;; M-x package-refresh-contents
;; M-x package-install RET starter-kit RETie
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(
        ;auto-complete-octave
        rspec-mode
        rinari
        inf-ruby
        ruby-compilation
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
        javascript
        nxml ; http://www.youtube.com/watch?v=kmZvVUgX1Ko
        coffee-mode
        haml-mode
        jade-mode
        sass-mode
        flymake-coffee
        flymake-cursor
        flymake-haml
;        flymake-jslint ; FIX
        flymake-ruby
        flymake-sass
        flymake-shell
        deft
        zenburn
        color-theme-twilight
        rainbow-mode ;; CSS: http://julien.danjou.info/rainbow-mode.html
        prolog
        haskell-mode
        )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))



(setq dropbox-dir (concat (getenv "HOME") "/Dropbox"))
(setq dropbox-tools-dir (concat dropbox-dir "/Tools"))
(setq dropbox-code-dir (concat dropbox-dir "/Code"))
(setq clojure-project-dir (concat dropbox-code-dir "/Clojure"))
(setq rails-project-dir (concat dropbox-code-dir "/Ruby/Rails"))
(setq js-project-dir (concat dropbox-code-dir "/JavaScript"))

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
(setq dotfiles-custom-dir (concat dotfiles-dir "custom/"))

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
(defun load-custom (f)
  (load-file (concat dotfiles-custom-dir f)))

;; Ensure these directories are on the load path
(add-dotfile-path "lib")
(add-lib-path "js2-mode")
(add-lib-path "ibuffer-git")
(add-lib-path "mk-project")
;(add-lib-path "rspec-mode")
(add-lib-path "zencoding")
(add-lib-path "rhtml")
(add-lib-path "ghc")
;(add-lib-path "w3m")

;; (require 'starter-kit)
;; (require 'starter-kit-defuns)
;; (require 'starter-kit-bindings)
;; (require 'starter-kit-misc)
;; (require 'starter-kit-registers)
;; (require 'starter-kit-eshell)
;; (require 'starter-kit-lisp)
;; (require 'starter-kit-perl)
;; (require 'starter-kit-ruby)
;; (require 'starter-kit-js)

(require 'buffer-move)        ; C-S <arrows>
;; (require 'custom-ruby)
(require 'dircolors)          ; colorize directories in C-x f
(require 'ibuffer-git)
(require 'linkd)

;; (require 'mwe-log-commands)   ; M-x mwe-open-log-commands
;; (require 'quick-jump)
;; (require 'rcodetools)         ; TODO: gem install rcodetools, # => +
;;                               ; M-x xmp (M-; M-;)
;; (require 'scratch)            ; scratch buffers in same mode as current buffer
;(require 'smooth-scrolling)   ; freezes the cursor 1/3rd up/down the screen
;; (require 'toggle)
;; (require 'tramp)
;; (require 'rspec-mode)         ; http://www.emacswiki.org/emacs/RspecMode
;; (require 'zencoding-mode)     ; https://github.com/rooney/zencoding

(load-config "ack.el")
(load-config "yasnippet.el")
(load-config "auto-complete.el")
(load-config "auto-modes.el")
(load-config "backup.el")
(load-config "ctags.el")
(load-config "cut-n-paste.el")
(load-config "deft.el")
; (load-config "durendal.el")
(load-config "ediff.el")
(load-config "erc-growl.el")
(load-config "erc.el")
(load-config "highlight-flash.el") ; flash s-expr on eval
(load-config "ibuffer.el")
(load-config "ido.el")
(load-config "isearch.el")
(load-config "markdown.el")
(load-config "multi-term.el")
(load-config "osx.el")
(load-config "paredit.el")
(load-config "mk-project.el")
(load-config "slime.el")
(load-config "smex.el")           ; M-x enhancement (like ido for commands)
(load-config "stringtemplate.el")
(load-config "undo-tree.el")
(load-config "window-number.el")
; (load-config "w3m.el") ; FIX

;(load-config "cedet.el")           ; TODO: set up for C
;(load-config "custom-faces.el") ; FIX: light
;(load-config "flymake.el")
(load-config "maxframe.el")

;(load-config "c.el")
;(load-config "clojure.el")         ; deps - rainbows, align-cljlet
(load-config "css.el")
(load-config "javascript.el")
;(load-config "lisps.el")
(load-config "nxml.el")
(load-config "haskell.el")
;(load-config "prolog.el")
;(load-config "ruby.el")



(load-custom "theme.el")
(load-custom "windows.el")
(load-custom "util-fns.el")
(load-config "built-in.el")
(load-custom "bindings.el")
