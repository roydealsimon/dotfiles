
;; create ctags on save
(require 'ctags-update)
(ctags-update-minor-mode 1)

(setq path-to-ctags "/usr/local/bin/ctags")

(defun create-tags (destination)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags destination (directory-file-name destination))))
