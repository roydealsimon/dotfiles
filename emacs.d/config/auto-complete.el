;;auto-complete mode
(require 'auto-complete)
(require 'auto-complete-config)

; TODO: yasnippet just doesn't work with auto-complete
; (add-lib-path "auto-complete")
; (require 'auto-complete-yasnippet)

(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories (concat dotfiles-lib-dir "auto-complete/dict"))

(setq ac-comphist-file (concat dotfiles-tmp-dir "ac-comphist.dat"))

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)
(setq ac-auto-start 2) ; start completion after 2 characters of a word
(setq ac-ignore-case nil) ; matches are case sensitive

(set-default 'ac-sources
             '(
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer
               ac-source-dictionary))
; ac-source-yasnippet

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode css-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                js2-mode javascript-mode ruby-mode java-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))


;;ac-slime auto-complete plugin
(add-lib-path "ac-slime")
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
