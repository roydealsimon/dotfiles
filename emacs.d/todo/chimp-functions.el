



;; ================================================================
;; PROGRAMMING FUNCTIONS
;; ================================================================

;; Complement to next-error
;(defun previous-error (n)
;  "Visit previous compilation error message and corresponding source code."
;  (interactive "p")
;  (next-error (- n)))

(defun global-trim ()
  "Trim all trailing whitespace in the current buffer."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" t t))))


;; ================================================================
;; PRACTICAL STUFF
;; ================================================================

;; Load my emacs file
(defun load-dot-emacs ()
 (interactive)
 (load-file "~/.emacs"))

; Convert from DOS -> UNIX
(defun dos2unix ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))

; Convert from UNIX -> DOS
(defun unix2dos ()
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\n" nil t) (replace-match "\r\n")))

;; Untabify the buffer
(defun my-untabify-buffer ()
  "Run Untabify against the current buffer."
  (interactive)
  (untabify (point-min) (point-max))
  (message "Untabify Complete"))



(provide 'chimp-functions)
