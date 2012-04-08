(require 'yasnippet)
(yas/initialize)
; (yas/global-mode 1)
;(setq yas/trigger-key (kbd "C-c z"))

(setq yas/root-directory (concat dotfiles-etc-dir "snippets"))

;; Load the snippets
(yas/load-directory yas/root-directory)
