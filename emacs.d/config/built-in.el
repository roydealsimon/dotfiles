;; FIXME: desktop-save-mode && global-linum-mode mess up buffer(delete path)
;; Packages required by all session
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)

(menu-bar-mode 1)

(display-battery-mode t)

(setq bookmark-default-file (concat dotfiles-etc-dir "bookmarks"))

;; create autosaves and backups tmp dirs if necessary
(make-directory (concat dotfiles-tmp-dir "autosaves") t)
(make-directory (concat dotfiles-tmp-dir "backups") t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/tmp/
(setq auto-save-file-name-transforms `((".*" ,(concat dotfiles-tmp-dir "autosaves/\\1") t)))
(setq backup-directory-alist `((".*" . ,(concat dotfiles-tmp-dir "backups"))))
(setq auto-save-list-file-name (concat dotfiles-tmp-dir "autosaves/autosave-list"))

;; save/restore desktop
;(desktop-save-mode 1)

;;When you visit a file, point goes to the last place where it was when you previously visited
;;Save file is set to dotfiles-tmp-dir/places
;; (setq-default save-place t)

;;enable cua-mode for rectangular selections
(require 'cua-base)
(require 'cua-gmrk)
(require 'cua-rect)
(cua-mode 1)
(setq cua-enable-cua-keys nil)

;;enable winner mode for C-c-(<left>|<right>) to navigate the history
;;of buffer changes i.e. undo a split screen
(when (fboundp 'winner-mode)
      (winner-mode 1))

(setq visible-bell nil
      column-number-mode t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      delete-by-moving-to-trash nil
      uniquify-buffer-name-style 'forward
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      save-place-file (concat dotfiles-tmp-dir "places"))

;; (global-linum-mode t)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
(if (window-system) (set-frame-size (selected-frame) 113 43))

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;; TABS
(setq-default indent-tabs-mode nil) ;; kill tabs
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(auto-compression-mode t)
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(random t) ;; Seed the random-number generator

(setq diff-switches "-u")

;; http://www.emacswiki.org/emacs/FlySpell
; use aspell
(setq-default ispell-program-name "/usr/local/bin/aspell")
;;Setup some dictionary languages
;(setq ispell-dictionary "british")'
;(setq flyspell-default-dictionary "british")
(setq flyspell-issue-message-flag nil)

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

(setq confirm-nonexistent-file-or-buffer nil)

;;remove all trailing whitespace and trailing blank lines before saving the file
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-blank-lines)
