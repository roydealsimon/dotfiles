;; ================================================================
;; EMACS KEY-BINDINGS
;; ================================================================

;; TODO:
;;       fill-region shortcut
;;       replace-regexp
;;       redo
;;       key free for power-macros. F1?
;;       re-builder
;;       dictionary, dictionary-search

;; ----------------------------------------------------------------
;; Function keys
;; ----------------------------------------------------------------


;; parentheses allow Xemacs to read the file too
(global-set-key [(f1)] 'call-last-kbd-macro)
(global-set-key [(shift f1)] 'copy-line-other-window)
(global-set-key [(f2)] 'find-tag)

(global-set-key [(f3)] 'replace-regexp)
(global-set-key [(f4)] 'eshell)
(global-set-key [(f5)] 'w3)

;(global-set-key [(f5)] 'first-error)
;(global-set-key [(shift f5)] 'previous-error)
;(global-set-key [(f6)] 'next-error)
;(global-set-key [(f7)] 'my-untabify-buffer)

(global-set-key [(f8)] 'grep)
(global-set-key [(shift f8)] 'search-duplicates)
(global-set-key [(f9)] 'isearch-repeat-forward)
(global-set-key [(shift f9)] 'isearch-repeat-backward)
(global-set-key [(f10)] 'query-replace-regexp)
(global-set-key [(f11)] 'revert-buffer)
(global-set-key [(f12)] 'eval-buffer) ;; compile?

; follow-mode
; deletes
; fill-region

;(global-set-key [f3] 'delete-other-window)
;(global-set-key [S-f3] 'delete-window)
;(global-set-key [(control f3)] 'kill-buffer)
;(global-set-key [f9] 'undo)
;(global-set-key [(shift f9)] 'redo)

;(global-set-key [f6]            'ff-find-other-file)
;(global-set-key [(shift f6)]    'my-buffer-file-name)
;(global-set-key [(shift f7)]    'make-clean)
;(global-set-key [(control f7)]  'my-set-compile)
;(global-set-key [f9]            'my-isearch-word-forward)
;(global-set-key [f10]           'find-tag-at-point)
;(global-set-key [(shift f10)]   'pop-tag-mark)
;(global-set-key [(control f10)] 'lxr-at-point)
;; I keep f11 free for temporary bindings
;(global-set-key [f12]           'revert-buffer)

   ;; Make C-h delete the previous char, instead of launching help
;      (define-key global-map "\C-h" 'backward-delete-char)
;  -> C-?

  ;; make sure C-h works in searches, too
;      (setq search-delete-char (string-to-char "\C-h"))
;; make M-h delete previous word
;      (define-key global-map "\M-h" 'backward-word-kill)
   ;;make C-x C-u the undo cmd - better than C-x u because you don't
   ;;to release the control key  
;      (define-key global-map "\C-x\C-u" 'undo)

; COMBOS
; F + F 12
; S + F 24
; C + F 36
; M + F 48
; C + M + F
;; ----------------------------------------------------------------
;; Miscellaneous Modes
;; ----------------------------------------------------------------


;; VI-DOT
(global-set-key "\C-xz" 'vi-dot)

;; CYCLEBUFFER
(global-set-key "\M-n" `cyclebuffer-forward)
(global-set-key "\M-p" `cyclebuffer-backward)

;; COMPILE
(global-set-key "\C-c\C-v\C-c" 'compile) 

;; YIC BUFFER
;(global-set-key "\C-x\C-p" 'bury-buffer)
;(global-set-key "\C-x\C-n" 'yic-next-buffer)
;(global-set-key "\C-x\C-j" 'yic-other-buffer) ; j for jump
;(global-set-key "\C-x\C-k" 'yic-kill-current-buffer)


;; ----------------------------------------------------------------
;; Cursor Movements
;; ----------------------------------------------------------------

(global-set-key [kp-home]  'beginning-of-buffer) ; [Home] 
(global-set-key [home]     'beginning-of-buffer) ; [Home] 
(global-set-key [kp-end]   'end-of-buffer)       ; [End] 
(global-set-key [end]      'end-of-buffer)       ; [End] 
(global-set-key [kp-prior] 'scroll-down)         ; [PgUp] 
(global-set-key [prior]    'scroll-down)         ; [PgUp] 
(global-set-key [kp-next]  'scroll-up)           ; [PgDn] 
(global-set-key [next]     'scroll-up)           ; [PgDn]

(global-set-key [(shift up)]     'scroll-n-lines-behind)
(global-set-key [(shift down)]   'scroll-n-lines-ahead)

;; S-C instead of C which I reserve for switching desktops
(global-set-key [(shift control down)]   'scroll-other-window-down-one)
(global-set-key [(shift control up)]     'scroll-other-window-up-one)

(global-set-key [(meta down)]   'scroll-up)           
(global-set-key [(meta up)]     'scroll-down)          

;; C-M-v
(global-set-key [(meta next)]   'scroll-other-window); takes arg lines
(global-set-key [(control meta down)]  'scroll-other-window)
;; C-M-S-v
(global-set-key [(meta prior)]  'scroll-other-window-down); 
(global-set-key [(control meta up)] 'scroll-other-window-down); 


(global-set-key [(control left)] 'delete-other-windows)
(global-set-key [(control right)]'delete-window)
;(global-set-key [C-up]   'other-window)
;(global-set-key [C-down] 'other-window-backward)

(global-set-key "\C-o" 'other-window)
; this doesn't work!
;(global-set-key [(shift control) ?o] 'other-window-backward)
(global-set-key "\M-," 'point-to-top)
(global-set-key "\M-/" 'point-to-bottom)
(global-set-key "\M-." 'point-to-center)

(global-set-key [(control next)]     'enlarge-window)
(global-set-key [(control prior)]   'shrink-window)

(global-set-key "\C-_" 'unscroll)
(global-set-key "\C-f" 'next-initial)

;; ----------------------------------------------------------------
;; Text Editing
;; ----------------------------------------------------------------

(global-set-key "\M-s" 'center-line)
(global-set-key "\M-r" 'line-to-top-of-window)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xl" 'copy-current-line)
(global-set-key "\C-xo" 'open-line)
(global-set-key "\C-cr" 'revert-buffer)   ;; already bound to f12
(global-set-key "\C-xe" 'load-dot-emacs)  ;; not necessary
(global-set-key "\C-xm" 'manual-entry)
(global-set-key "\C-ci" 'insert-date-string)

;; Key binding to invoke the dictionary client
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)




(global-set-key [kp-subtract] 'undo) ; [Undo] 
(global-set-key [insert]    'overwrite-mode) ; [Ins] 
(global-set-key [kp-insert] 'overwrite-mode) ; [Ins] 


;(global-set-key delete-whitespace-rectangle)

;; Makes control + home/end go to beginning/end of buffer
;(global-set-key "\C-cs" 'search-duplicates)    



;(defun glimpse (words)
;(interactive 
;(list (read-string "Search Glimpse index for: ")))
;(let ((grep-null-device ""))
;(grep (concat "glimpse -inwy \"" words "\""))))     

;(defun find-grep (named word)
; (interactive 
;(list (read-string "Find files named: ")
; (read-string "Containing: ")))
;(let ((grep-null-device ""))
;(grep (concat "find . -name '" named "' | xargs grep -n " word)))) 

;(server-start) ;; for mutt

; Scroll using mouse - get it to work
;(mouse-wheel-mode 't)


;; TODO
;(global-set-key [f6] 'calendar)
;(global-set-key [f7] 'todo-mode)
;(autoload 'todo-mode "todo-mode"
;  "Major mode for editing TODO lists." t)
;(autoload 'todo-show "todo-mode"
;  "Show TODO items." t)
;(autoload 'todo-insert-item "todo-mode"
;  "Add TODO item." t)

;(global-set-key "\C-ct" 'todo-show) ;; switch to TODO buffer
;(global-set-key "\C-ci" 'todo-insert-item) ;; insert new item

;(add-hook 'diary-display-hook 'fancy-diary-display)
;(add-hook 'list-diary-entries-hook 'include-other-diary-files)
;(setq diary-file "~/.diary")


;; SHELL TOGGLE (Problem - treated as login-shell...)
;(autoload 'shell-toggle "shell-toggle" 
;  "Toggles between the *shell* buffer and whatever buffer you are editing." t)
;(autoload 'shell-toggle-cd "shell-toggle" 
; "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;(global-set-key [f9] 'shell-toggle)
;(global-set-key [f10] 'shell-toggle-cd)


;;; DICTIONARY
;(load "dictionary-init")
;; key bindings
;(global-set-key "\C-cs" 'dictionary-search)
;(global-set-key "\C-cm" 'dictionary-match-words)
;; global dictionary-mode
;(global-dictionary-tooltip-mode)
;(setq ispell-dictionary "american")    


;(eval-after-load "w3"
;   '(progn
;    (fset 'w3-fetch-orig (symbol-function 'w3-fetch))
;    (defun w3-fetch (&optional url target)
;    (interactive (list (w3-read-url-with-default)))
;    (if (eq major-mode 'gnus-article-mode)
;          (browse-url url)
;   (w3-fetch-orig url target)))))

;(autoload 'w3m "w3m" "*Interface for w3m on Emacs." t)
;(autoload 'w3m-find-file "w3m" "*w3m interface function for local file." t)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;(autoload 'w3m-search "w3m-search" "*Search QUERY using SEARCH-ENGINE." t)
;(autoload 'w3m-weather "w3m-weather" "*Display weather report." t)
;(autoload 'w3m-antenna "w3m-antenna" "*Report chenge of WEB sites." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; New Functions - check them out!!!
; Ctrl-Tab switches buffers
;(global-set-key [(meta tab)] 'bury-buffer)

;(set-language-environment "Latin-1")
;(set-terminal-coding-system 'latin-9)
;(set-keyboard-coding-system 'latin-9)
;(set-input-mode nil nil 1)
;(require 'iso-transl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-hook `diary-hook `appt-make-list)
;(display-time)
;(diary)

;(setq view-diary-entries-initially t
;        mark-diary-entries-in-calendar t       ;; GOOD
;        number-of-diary-entries 7)
;(add-hook 'diary-display-hook 'fancy-diary-display)  
;(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; APPT
;(setq view-diary-entries-initially t)
;(setq appt-issue-message t)
;(add-hook 'diary-hook 'appt-make-list)
;(add-hook 'mark-diary-entries-hook 'mark-included-diary-files)



;(add-hook 'dired-load-hook
; (lambda ()
; (load "dired-x")
 ;; Set dired-x global variables here.  For example:
 ;; (setq dired-guess-shell-gnutar "gtar")
 ;; (setq dired-x-hands-off-my-keys nil)
; ))
;(add-hook 'dired-mode-hook
; (lambda ()
 ;; Set dired-x buffer-local variables here.  For example:
 ;; (setq dired-omit-files-p t)
; ))


     ;;; Autoload `dired-jump' and `dired-jump-other-window'.
     ;;; We autoload from FILE dired.el.  This will then load dired-x.el
     ;;; and hence define `dired-jump' and `dired-jump-other-window'.
;     (define-key global-map "\C-x\C-j" 'dired-jump)
;     (define-key global-map "\C-x4\C-j" 'dired-jump-other-window)
     
;     (autoload (quote dired-jump) "dired" "\
;     Jump to Dired buffer corresponding to current buffer.
;     If in a file, Dired the current directory and move to file's line.
;     If in Dired already, pop up a level and goto old directory's line.
;     In case the proper Dired file line cannot be found, refresh the Dired
;     buffer and try again." t nil)
     
;     (autoload (quote dired-jump-other-window) "dired" "\
;     Like \\[dired-jump] (dired-jump) but in other window." t nil)

;     (define-key global-map "\C-x\C-j" 'dired-jump)


;     (add-hook 'dired-load-hook
;               (lambda ()
;                 ;; Bind dired-x-find-file.
;                 (setq dired-x-hands-off-my-keys nil)
;                 (load "dired-x")
;                 ))
;; M-o (dired-omit-toggle)
;;(setq dired-omit-files-p t) -> dired-mode-hook

;; ----------------------------------------------------------------
;; FUNCTIONS
;; ----------------------------------------------------------------

; H1
; L1
; copy-line-other-window

; enlarge-window
; shrink-window
; dup-line
; query-replace-regexp

; D goto-line
; D scroll-other-window
; D scroll-other-window-down

; D compile
; first-error
; previous-error
; next-error
; search-duplicates

; outline-mode
; eshell
; w3m

;; ----------------------------------------------------------------
;; KEYS
;; ----------------------------------------------------------------


; SCROLL 'EM SCROLL 'EM SCROLL 'EM!!
; S C-o   other-window-backwards

; S up    scroll-up-one
; S down  scroll-down-one
; M up    scroll-up
; M down  scroll-down

; C up    scroll-up-one-other-window
; C down  scroll-down-one-other-window
; C-Mup	  down-other-window
; C-up 	  up-other-window

; C next  enlarge-window
; C prior shrink-window

; C-x C-n nil
; C-x C-p nil
; C-x z   vi-dot
; C-x g   goto-line
; C-x o   open-line
; c-x l   copy-line
; c-x r  revert-buffer - stinks! too many use c-x r
; c-x e  load-dot-emacs (was: call-last-kbd-macro)
; c-x m  manual-entry (was: compose-mail)

; C-cs   dictionary-search)
; C-cm   dictionary-match-words)
; C-c d
; C-c e
; C-c t
; C-c i
; c-c r  revert-buffer - stinks! too many use c-x r

; M-n       cyclebuffer-forward
; M-p       cyclebuffer-backward
; M-r       line-to-top-of-window
; M-o       nil
; M-, M-/ M-.
; M-s       center-line
; M-*

; M-s r

; C-q     insert quote
; C-z
; C-l
; C-_     unscroll
; C-f     next-initial (of word)

(provide 'chimp-keybindings)
