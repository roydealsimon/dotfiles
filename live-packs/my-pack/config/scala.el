;; https://github.com/hvesalai/scala-mode2
(add-to-list 'load-path "/Users/roy/.emacs.d/lib/scala-mode2/")
(require 'scala-mode2)
(add-hook 'scala-mode-hook '(lambda ()

  ;; Bind the 'newline-and-indent' command to RET (aka 'enter'). This
  ;; is normally also available as C-j. The 'newline-and-indent'
  ;; command has the following functionality: 1) it removes trailing
  ;; whitespace from the current line, 2) it create a new line, and 3)
  ;; indents it.  An alternative is the
  ;; 'reindent-then-newline-and-indent' command.
  (local-set-key (kbd "RET") 'newline-and-indent)

  ;; Alternatively, bind the 'newline-and-indent' command and
  ;; 'scala-indent:insert-asterisk-on-multiline-comment' to RET in
  ;; order to get indentation and asterisk-insertion within multi-line
  ;; comments.
  ;; (local-set-key (kbd "RET") '(lambda ()
  ;;   (interactive)
  ;;   (newline-and-indent)
  ;;   (scala-indent:insert-asterisk-on-multiline-comment)))

  ;; Bind the 'join-line' command to C-M-j. This command is normally
  ;; bound to M-^ which is hard to access, especially on some European
  ;; keyboards. The 'join-line' command has the effect or joining the
  ;; current line with the previous while fixing whitespace at the
  ;; joint.
  (local-set-key (kbd "C-M-j") 'join-line)

  ;; Bind the backtab (shift tab) to
  ;; 'scala-indent:indent-with-reluctant-strategy command. This is usefull
  ;; when using the 'eager' mode by default and you want to "outdent" a
  ;; code line as a new statement.
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

  ;; and other bindings here
  ))

(add-hook 'scala-mode-hook '(lambda ()
  (require 'whitespace)

  ;; clean-up whitespace at save
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)

  ;; turn on highlight. To configure what is highlighted, customize
  ;; the *whitespace-style* variable. A sane set of things to
  ;; highlight is: face, tabs, trailing
  (whitespace-mode)
  ))

;; (require 'scala-mode-auto)
;; (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

(add-to-list 'load-path "/Users/roy/.emacs.d/lib/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-to-list 'auto-mode-alist '("\\.ensime$" . scala-mode))


;; add to project/plugins.sbt
;; project/plugins.sbt -> addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "0.1.1")
;; ensime generate

;; (require 'scala-mode-auto)
;; (add-hook 'scala-mode-hook
;;             '(lambda ()
;;                (scala-mode-feature-electric-mode)))

;;  (eval-after-load "scala-mode"
;;    '(progn
;;       (define-key scala-mode-map (kbd "<f9>") 'ensime-builder-build)
;;       (define-key scala-mode-map (kbd "<f10>") 'ensime-inf-switch)))
;; (eval-after-load "scala-mode"
;;   '(progn
;;      (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;;      (define-key scala-mode-map (kbd "<f9>") 'scala-run)
;;      (define-key scala-mode-map (kbd "RET") 'newline-and-indent)
;;      ))

;;   (defun scala-run ()
;;       (interactive)
;;      (ensime-sbt-action "run")
;;      (ensime-sbt-action "~compile")
;;  (let ((c (current-buffer)))
;;       (switch-to-buffer-other-window
;;      (get-buffer-create (ensime-sbt-build-buffer-name)))
;;    (switch-to-buffer-other-window c)))
