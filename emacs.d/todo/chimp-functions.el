(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

;;;;; My First Functions! ;;;;;
(defun scroll-other-window-down-one ()
  (interactive)
  (scroll-other-window 1))

(defun scroll-other-window-up-one ()
  (interactive)
  (scroll-other-window -1))

(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

;; Cursor Movements
(defun point-to-top ()
  "Put point on top line of window."
  (interactive)
  (move-to-window-line 0))

(defun point-to-bottom ()
  "Put point at beginning of last visible line."
  (interactive)
  (move-to-window-line -1))

(defun point-to-center ()
  "Put point to the center of window. By Me!"
  (interactive)
   (move-to-window-line (/ (window-height) 2)))

(defun copy-current-line ()
  "Copy current line."
  (interactive)
  (kill-new (buffer-substring (point-at-bol) (point-at-eol)))
  (message "line copied successfully!"))

(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive)
  (recenter 0))

;; unscroll
;; this var holds all the global info
(defvar unscroll-point (make-marker)
  "Cursor position for next call to 'unscroll'.")
(defvar unscroll-window-start (make-marker)
  "Window start for next call to 'unscroll'.")
(defvar unscroll-hscroll nil
  "Hscroll for next call to 'unscroll'.")

(put 'scroll-up 'unscrollable t)
(put 'scroll-down 'unscrollable t)
(put 'scroll-left 'unscrollable t)
(put 'scroll-right 'unscrollable t)


(defun unscroll-maybe-remember ()
   (if (not (get last-command 'unscrollable))
       (progn
	(set-marker unscroll-point (point))
        (set-marker unscroll-window-start (window-start))
	(setq unscroll-hscroll (window-hscroll)))))

(defadvice scroll-up (before remember-for-unscroll
			     activate compile)
  "Remember where we stated from, for 'unscroll'."
  (unscroll-maybe-remember))

(defadvice scroll-down (before remember-for-unscroll
			      activate compile)
  "Remember where we stated from, for 'unscroll'."
  (unscroll-maybe-remember))

(defadvice scroll-left (before remember-for-unscroll
			       activate compile)
   "Remember where we started from, for 'unscroll'."
   (unscroll-maybe-remember))

(defadvice scroll-right (before remember-for-unscroll
			       activate compile))

(defun unscroll ()
  "Revert to 'unscroll-point' and 'unscroll-window-start'."
  (interactive)
;;  (if (not unscroll-point) ;; i.e. if unscroll-point is nil
;;      (error "Cannot unscroll yet"))
  (goto-char unscroll-point)
  (set-window-start nil unscroll-window-start) ;; nil = current win
  (set-window-hscroll nil unscroll-hscroll))

(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

 (defun count-words (start end)
   "Print number of words in the region."
   (interactive "r")
   (save-excursion
	 (save-restriction
	   (narrow-to-region start end)
	   (goto-char (point-min))
	   (count-matches "\\sw+"))))



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

(defun vi-bounce-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'vi-bounce-paren)
;; ================================================================
;; PRACTICAL STUFF
;; ================================================================

;; Load my emacs file
(defun load-dot-emacs ()
 (interactive)
 (load-file "~/.emacs"))

;; Search for duplicates
(defun search-duplicates ()
  "Search for two duplicate words in buffer."
  ;; we're looking for:
  ;; the start of a word+any chars at least once+
  ;; the end of the word+any tabs, spaces or newlines+
  ;; the repeated word
  (interactive)
  (search-forward-regexp "\\(\\b\\w+\\b\\)[ \t\n]+\\b\\1\\b"))

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

;; Insert Date
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%b %d, %Y")))


;; Call yosucker
(defun yosucker ()
  (interactive)
  (shell-command-to-string "yosucker"))

;; ================================================================
;; FUN STUFF!
;; ================================================================

;; Call fortune!  I got this from dotfiles.com
(defun fortune ()
  (interactive)
  (pop-to-buffer "*Fortune*")
  (insert (shell-command-to-string "/usr/games/fortune")))

; a function to re-strfile my fortune file
(defun re-fortune ()
  (interactive)
  (shell-command-to-string "cd /usr/share/games/fortunes ; strfile charlie"))

(provide 'chimp-functions)

(defun my-zoom (n)
  "Increase or decrease font size based upon argument"
  (set-face-attribute 'default (selected-frame) :height
                      (+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10)))
  (global-set-key (kbd "C-+")      '(lambda nil (interactive) (my-zoom 1)))
  (global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
  (global-set-key (kbd "C-_")      '(lambda nil (interactive) (my-zoom -1)))
  (global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1)))))
