(require 'nxml-mode)
(when nxml-bind-meta-tab-to-complete-flag
  (nxml-bind-meta-tab-to-complete-flag t))
(when nxml-slash-auto-complete-flag
  (nxml-slash-auto-complete-flag t))


;; http://www.youtube.com/watch?v=kmZvVUgX1Ko

;; wget -r http://syntax.whattf.org/relaxng/ (ctrl-c when the .rnc files are down)
;; Emacs XML > Set Schema > File

;; View image: find-file-at-point
;; View buffer; browse-url-of-buffer

(defun replace-html-chars-region (start end)
  "Replace Ò<Ó to Ò&lt;Ó and other chars in HTML.
This works on the current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "&" nil t) (replace-match "&amp;" nil t))
    (goto-char (point-min))
    (while (search-forward "<" nil t) (replace-match "&lt;" nil t))
    (goto-char (point-min))
    (while (search-forward ">" nil t) (replace-match "&gt;" nil t))))
