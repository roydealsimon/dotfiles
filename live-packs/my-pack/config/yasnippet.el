;; http://capitaomorte.github.com/yasnippet/
(require 'yasnippet)
(yas/initialize)
(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))
(setq yas/root-directory (concat dotfiles-etc-dir "snippets"))
(yas/load-directory yas/root-directory) ;; Load the snippets

; (yas/global-mode 1)

;; (setq yas/trigger-key (kbd "C-c z"))

(add-hook 'clojure-mode-hook (lambda () (yas/minor-mode-on)))
(add-hook 'js2-mode-hook (lambda () (yas/minor-mode-on)))

; M-x describe-function RET yas/define-snippets RET
; M-x describe-function RET yas/compile-bundle RET.
