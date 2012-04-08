

(defun whack-whitespace (arg)
      "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
      (interactive "P")
      (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
        (re-search-forward regexp nil t)
        (replace-match "" nil nil)))

(defun comment-or-uncomment-current-line-or-region ()
  "Comments or uncomments current current line or whole lines in region."
  (interactive)
  (save-excursion
    (let (min max)
      (if (region-active-p)
          (setq min (region-beginning) max (region-end))
        (setq min (point) max (point)))
      (comment-or-uncomment-region
       (progn (goto-char min) (line-beginning-position))
       (progn (goto-char max) (line-end-position))))))

(defun switch-to-slime ()
  (interactive)
  (split-window-above-each-other)
  (switch-to-buffer-other-window "*slime-repl nil*"))

(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(setq-default kill-read-only-ok t)

(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

(defun local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun turn-on-hl-line-mode ()
  (if window-system (hl-line-mode t)))

(defun turn-on-save-place-mode ()
  (setq save-place t))

(defun turn-on-whitespace ()
  (whitespace-mode t))

(defun turn-on-paredit ()
  (paredit-mode t))

(defun turn-off-tool-bar ()
  (tool-bar-mode -1))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'coding-hook 'local-column-number-mode)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
(add-hook 'coding-hook 'pretty-lambdas)
(add-hook 'coding-hook 'add-watchwords)

(defun run-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (run-hooks 'coding-hook))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; Cosmetic

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun recompile-libs ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-lib-dir 0))

(defun regen-autoloads (&optional force-regen)
  "Regenerate the autoload definitions file if necessary and load it."
  (interactive "P")
  (let ((autoload-dir (concat dotfiles-dir "/elpa-to-submit"))
        (generated-autoload-file autoload-file))
    (when (or force-regen
              (not (file-exists-p autoload-file))
              (some (lambda (f) (file-newer-than-file-p f autoload-file))
                    (directory-files autoload-dir t "\\.el$")))
      (message "Updating autoloads...")
      (let (emacs-lisp-mode-hook)
        (update-directory-autoloads autoload-dir))))
  (load autoload-file))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun switch-or-start (function buffer)
  "If the buffer is current, bury it, otherwise invoke the function."
  (if (equal (buffer-name (current-buffer)) buffer)
      (bury-buffer)
    (if (get-buffer buffer)
        (switch-to-buffer buffer)
      (funcall function))))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%b %d, %Y")))

(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun latexify-quotes ()
  "Replace fancy quote marks with their simpler counterparts. Useful when
   dealing with LaTeX documents"
  (interactive)
  (let ((st (region-beginning))
        (end (region-end)))
    (replace-string "Ô" "`" nil st end)
    (replace-string "Õ" "'" nil st end)
    (replace-string "Ò" "\`\`" nil st end)
    (replace-string "Ó" "''" nil st end)))

(defun my-zoom (n)
  "Increase or decrease font size based upon argument"
  (set-face-attribute 'default (selected-frame) :height
                      (+ (face-attribute 'default :height) (* (if (> n 0) 1 -1) 10)))
  (global-set-key (kbd "C-+")      '(lambda nil (interactive) (my-zoom 1)))
  (global-set-key [C-kp-add]       '(lambda nil (interactive) (my-zoom 1)))
  (global-set-key (kbd "C-_")      '(lambda nil (interactive) (my-zoom -1)))
  (global-set-key [C-kp-subtract]  '(lambda nil (interactive) (my-zoom -1))))


;; Search for duplicates
(defun search-duplicates ()
  "Search for two duplicate words in buffer."
  ;; we're looking for:
  ;; the start of a word+any chars at least once+
  ;; the end of the word+any tabs, spaces or newlines+
  ;; the repeated word
  (interactive)
  (search-forward-regexp "\\(\\b\\w+\\b\\)[ \t\n]+\\b\\1\\b"))

(defun vi-bounce-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
;(global-set-key "%" 'vi-bounce-paren)

 (defun count-words (start end)
   "Print number of words in the region."
   (interactive "r")
   (save-excursion
	 (save-restriction
	   (narrow-to-region start end)
	   (goto-char (point-min))
	   (count-matches "\\sw+"))))




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

;; ================================================================
;; SCROLLING FUNCTIONS
;; ================================================================

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

;; dates
(defun insert-time ()
  "Insert the current time according to insert-time-format."
  (interactive "*")
  (insert (format-time-string insert-time-format (current-time))))

(defun insert-date ()
  "Insert the current date according to insert-date-format."
  (interactive "*")
  (insert (format-time-string insert-date-format (current-time))))
