;; http://capitaomorte.github.com/yasnippet/
(require 'yasnippet)
(yas/initialize)
(yas/global-mode 1)
(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))
(setq yas/root-directory (concat dotfiles-etc-dir "snippets"))
(yas/load-directory yas/root-directory) ;; Load the snippets

;; (setq yas/trigger-key (kbd "C-c z"))

; M-x describe-function RET yas/define-snippets RET
; M-x describe-function RET yas/compile-bundle RET.
