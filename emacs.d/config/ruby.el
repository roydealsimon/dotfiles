(require 'yaml-mode)
(require 'inf-ruby)
(require 'ruby-compilation)
(require 'rinari)
(require 'rhtml-mode)

(defun ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (let ((properties (text-properties-at (point))))
    (when (and
           (memq 'font-lock-string-face properties)
           (save-excursion
             (ruby-forward-string "\"" (line-end-position) t)))
      (insert "{}")
      (backward-char 1))))

;;; enables outlining for ruby
;;; You may also want to bind hide-body, hide-subtree, show-substree
;;; show-all, show-children, ... to some keys easy folding and unfolding
(add-hook 'ruby-mode-hook
              '(lambda ()
                 (outline-minor-mode)
                 (setq outline-regexp " *\\(def \\|class\\|module\\|describe \\|it \\)")))

(setq rinari-tags-file-name "TAGS")

(add-hook 'rhtml-mode '(lambda ()
                         (rinari-launch)
                         (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)))
