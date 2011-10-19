
;; Org Mode
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c o a") 'org-agenda-list)
(global-set-key (kbd "C-c o c") 'org-capture)
(global-set-key (kbd "C-c o d") 'org-date)
(global-set-key (kbd "C-c o j") 'org-journal-entry)
(global-set-key (kbd "C-c o l") 'org-timeline)
(global-set-key (kbd "C-c o m") 'org-tags-view)
(global-set-key (kbd "C-c o p") 'org-insert-property-drawer)
(global-set-key (kbd "C-c o s") 'org-agenda-list-stuck-projects)
(global-set-key (kbd "C-c o t") 'org-todo-list)
;(global-set-key (kbd "C-c r") 'org-remember)


;; (global-set-key "\C-c L" 'org-insert-link-global)
;; (global-set-key "\C-c o" 'org-open-at-point-global)

;; deft
(global-set-key (kbd "<f9>") 'deft)

;; comments
(global-set-key (kbd "C-c u") 'comment-or-uncomment-current-line-or-region)

;; clojure
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)
(global-set-key (kbd "C-c C-a") 'align-cljlet)
(global-set-key (kbd "C-c C-s") 'switch-to-slime)

;; editing
(global-set-key "\M-z" 'undo-tree-undo) ; was: C-/
(global-set-key "\M-?" 'undo-tree-redo) ; was: C-?
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key "\C-z" 'zap-to-char)    ; was: M-z

;; navigation
;(global-set-key (kbd "C-c a") 'ack)

;;make C-] and M-] cut and copy respectively
(global-set-key (kbd "C-]") 'kill-region)
(global-set-key (kbd "M-]") 'kill-ring-save)

;;mark current function
(global-set-key (kbd "C-x C-p")     'mark-defun)

;;remove whitespace between point and next word
(global-set-key (kbd "C-c k")     'whack-whitespace)
(global-set-key (kbd "C-c C-k")   'whack-whitespace)

;;paredit
;(global-set-key (kbd "C-M-f")     'paredit-forward)
;(global-set-key (kbd "C-M-b")     'paredit-backward)

;;C-c handy shortcuts
;;m - emacs eval shortcuts
;;s - slime eval shortcuts
;;t - text manipulation shortcuts
;;i - utf8 char shortcuts
;;j - quick-jump shortcuts
;;d - diff shortcuts
;;p - project shortcuts

;;text manipulation shortcuts
;; (global-set-key (kbd "C-c t b")     'untabify-buffer)
;; (global-set-key (kbd "C-c t r")     'untabify)

;;C-c C-? bindings
(global-set-key (kbd "C-c C-e")   'slime-eval-last-expression)

;;emacs-lisp shortcuts
(global-set-key (kbd "C-c m s")     'eval-and-replace) ;swap
(global-set-key (kbd "C-c m b")     'eval-buffer)
(global-set-key (kbd "C-c m e")     'eval-last-sexp)
(global-set-key (kbd "C-c m i")     'eval-expression)
(global-set-key (kbd "C-c m d")     'eval-defun)
(global-set-key (kbd "C-c m n")     'eval-print-last-sexp)
(global-set-key (kbd "C-c m r")     'eval-region)

;;slime mode shortcuts
(global-set-key (kbd "C-c s c")     'slime-connect)
(global-set-key (kbd "C-c s e e")   'slime-eval-last-expression)
(global-set-key (kbd "C-c s e b")   'slime-eval-buffer)
(global-set-key (kbd "C-c s e i")   'slime-eval-describe)
(global-set-key (kbd "C-c s e a")   'slime-eval-async)
(global-set-key (kbd "C-c s e d")   'slime-eval-defun)
(global-set-key (kbd "C-c s e f")   'slime-eval-feature-expression)
(global-set-key (kbd "C-c s e l")   'slime-eval-for-lisp)
(global-set-key (kbd "C-c s e m")   'slime-eval-macroexpand-inplace)
(global-set-key (kbd "C-c s e n")   'slime-eval-print-last-expression)
(global-set-key (kbd "C-c s e r")   'slime-eval-region)
(global-set-key (kbd "C-c s e t")   'slime-eval-with-transcript)

;;funky characters
(global-set-key (kbd "C-c i l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "C-c i n") (lambda () (interactive) (insert "ℕ")))
(global-set-key (kbd "C-c i i") (lambda () (interactive) (insert "∞")))
(global-set-key (kbd "C-c i .") (lambda () (interactive) (insert "×")))
(global-set-key (kbd "C-c i 0") (lambda () (interactive) (insert "∅")))
(global-set-key (kbd "C-c i u") (lambda () (interactive) (insert "∪")))
(global-set-key (kbd "C-c i s") (lambda () (interactive) (insert "♯")))

(global-set-key (kbd "C-c j p") 'quick-jump-go-back)
(global-set-key (kbd "C-c j b") 'quick-jump-go-back)
(global-set-key (kbd "C-c j m") 'quick-jump-push-marker)
(global-set-key (kbd "C-c j n") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j f") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j c") 'quick-jump-clear-all-marker)

;;diff shortcuts
(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)

;;mk-project shortcuts
(global-set-key (kbd "C-c p l") 'project-load)
(global-set-key (kbd "C-c p u") 'project-unload)
(global-set-key (kbd "C-c p c") 'project-compile)
(global-set-key (kbd "C-c p g") 'project-grep)
(global-set-key (kbd "C-c p a") 'project-ack)
(global-set-key (kbd "C-c p o") 'project-multi-occur)
(global-set-key (kbd "C-c p f") 'project-find-file-ido)
(global-set-key (kbd "C-c p F") 'project-find-file)
(global-set-key (kbd "C-c p h") 'project-home)
(global-set-key (kbd "C-c p i") 'project-index)
(global-set-key (kbd "C-c p t") 'project-tags)
(global-set-key (kbd "C-c p d") 'project-dired)
(global-set-key (kbd "C-c p s") 'project-status)



;;make ^h delete rather than help
;(global-set-key (kbd "C-h") 'delete-backward-char)

;;redefine help shortcut
;(global-set-key (kbd "M-§") 'help-command)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
;(global-set-key (kbd "C-w") 'backward-kill-word)
;(define-key lisp-mode-shared-map (kbd "C-w") 'paredit-backward-kill-word)

;;delete current word
;(global-set-key (kbd "M-w") (lambda () (interactive) (backward-word) (kill-word 1)))

;;kill regions
;(global-set-key (kbd "C-x C-k") 'kill-region)

;;shrink and grow windows
;(global-set-key (kbd "C-c .") 'shrink-window-horizontally)
;(global-set-key (kbd "C-c ,") 'enlarge-window-horizontally)

;;set the mark
;(global-set-key (kbd "C-SPC") 'set-mark-command)

;;repeat previous command
;(global-set-key (kbd "C-v") 'repeat)

;;scroll other window
(global-set-key (kbd "C-M-]") 'scroll-other-window)
(global-set-key (kbd "C-M-[") 'scroll-other-window-down)

(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w r") 'rotate-windows)

;;requires buffer-move
(global-set-key (kbd "C-c w p")  'buf-move-up)
(global-set-key (kbd "C-c w n")  'buf-move-down)
(global-set-key (kbd "C-c w b")  'buf-move-left)
(global-set-key (kbd "C-c w f")  'buf-move-right)

;;fast vertical naviation
(global-set-key  (kbd "M-P") (lambda () (interactive) (previous-line 10)))
(global-set-key  (kbd "M-N") (lambda () (interactive) (next-line 10)))
(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;;requires cua-mode for rectangle selection
;(global-set-key (kbd "§") 'cua-set-rectangle-mark)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
;(global-set-key (kbd "C-x C-M-f") 'find-file-in-project) ; C-c f
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; Magit
;(global-set-key (kbd "C-x g") 'magit-status)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;(global-set-key (kbd "M-v")  'yank)
;(global-set-key (kbd "C-M-_") 'undo-tree-undo)

(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c f") 'winner-redo)

(define-key grep-mode-map (kbd "s") (lambda () (interactive) (previous-error-no-select) (next-error-no-select)))
(define-key grep-mode-map (kbd "S") (lambda () (interactive) (next-error-no-select) (previous-error-no-select)))

;; Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-x C-h") 'view-url)

;; ================================================================
;; ORIGINAL EMACS KEY-BINDINGS
;; ================================================================

;; parentheses allow Xemacs to read the file too
(global-set-key [(f1)] 'call-last-kbd-macro)
(global-set-key [(shift f1)] 'copy-line-other-window)
(global-set-key [(f2)] 'find-tag)

(global-set-key [(f3)] 'replace-regexp)
;(global-set-key [(f4)] 'eshell)
;(global-set-key [(f5)] 'w3)

;(global-set-key [(f5)] 'first-error)
;(global-set-key [(shift f5)] 'previous-error)
;(global-set-key [(f6)] 'next-error)
;(global-set-key [(f7)] 'my-untabify-buffer)

;(global-set-key [(f8)] 'grep)
;(global-set-key [(shift f8)] 'search-duplicates)
;; (global-set-key [(f9)] 'isearch-repeat-forward)
;; (global-set-key [(shift f9)] 'isearch-repeat-backward)
;; (global-set-key [(f10)] 'query-replace-regexp)
;; (global-set-key [(f11)] 'revert-buffer)
;; (global-set-key [(f12)] 'eval-buffer) ;; compile?

;; (global-set-key [f3] 'delete-other-window)
;; (global-set-key [S-f3] 'delete-window)
;; (global-set-key [(control f3)] 'kill-buffer)
;; (global-set-key [f9] 'undo)
;; (global-set-key [(shift f9)] 'redo)

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

;; VI-DOT
;; (global-set-key "\C-xz" 'vi-dot)

;; ;; CYCLEBUFFER
;; (global-set-key "\M-n" `cyclebuffer-forward)
;; (global-set-key "\M-p" `cyclebuffer-backward)

;; ;; COMPILE
;; (global-set-key "\C-c\C-v\C-c" 'compile)


;; ----------------------------------------------------------------
;; Cursor Movements
;; ----------------------------------------------------------------

;; (global-set-key [kp-home]  'beginning-of-buffer) ; [Home]
;; (global-set-key [home]     'beginning-of-buffer) ; [Home]
;; (global-set-key [kp-end]   'end-of-buffer)       ; [End]
;; (global-set-key [end]      'end-of-buffer)       ; [End]
;; (global-set-key [kp-prior] 'scroll-down)         ; [PgUp]
;; (global-set-key [prior]    'scroll-down)         ; [PgUp]
;; (global-set-key [kp-next]  'scroll-up)           ; [PgDn]
;; (global-set-key [next]     'scroll-up)           ; [PgDn]

;; (global-set-key [(shift up)]     'scroll-n-lines-behind)
;; (global-set-key [(shift down)]   'scroll-n-lines-ahead)

;; ;; S-C instead of C which I reserve for switching desktops
;; (global-set-key [(shift control down)]   'scroll-other-window-down-one)
;; (global-set-key [(shift control up)]     'scroll-other-window-up-one)

;; (global-set-key [(meta down)]   'scroll-up)
;; (global-set-key [(meta up)]     'scroll-down)

;; ;; C-M-v
;; (global-set-key [(meta next)]   'scroll-other-window); takes arg lines
;; (global-set-key [(control meta down)]  'scroll-other-window)
;; ;; C-M-S-v
;; (global-set-key [(meta prior)]  'scroll-other-window-down);
;; (global-set-key [(control meta up)] 'scroll-other-window-down);


;; (global-set-key [(control left)] 'delete-other-windows)
;; (global-set-key [(control right)]'delete-window)
;; ;(global-set-key [C-up]   'other-window)
;; ;(global-set-key [C-down] 'other-window-backward)

;; (global-set-key "\C-o" 'other-window)
;; ; this doesn't work!
;; ;(global-set-key [(shift control) ?o] 'other-window-backward)
;; (global-set-key "\M-," 'point-to-top)
;; (global-set-key "\M-/" 'point-to-bottom)
;; (global-set-key "\M-." 'point-to-center)

;; (global-set-key [(control next)]     'enlarge-window)
;; (global-set-key [(control prior)]   'shrink-window)

;; (global-set-key "\C-_" 'unscroll)
;; (global-set-key "\C-f" 'next-initial)

;; ;; ----------------------------------------------------------------
;; ;; Text Editing
;; ;; ----------------------------------------------------------------

;; (global-set-key "\M-s" 'center-line)
;; (global-set-key "\M-r" 'line-to-top-of-window)
;; (global-set-key "\C-xg" 'goto-line)
;; (global-set-key "\C-xl" 'copy-current-line)
;; (global-set-key "\C-xo" 'open-line)
;; (global-set-key "\C-cr" 'revert-buffer)   ;; already bound to f12
;; (global-set-key "\C-xe" 'load-dot-emacs)  ;; not necessary
;; (global-set-key "\C-xm" 'manual-entry)
;; (global-set-key "\C-ci" 'insert-date-string)

;; ;; Key binding to invoke the dictionary client
;; (global-set-key "\C-cs" 'dictionary-search)
;; (global-set-key "\C-cm" 'dictionary-match-words)

;; (global-set-key [kp-subtract] 'undo) ; [Undo]
;; (global-set-key [insert]    'overwrite-mode) ; [Ins]
;; (global-set-key [kp-insert] 'overwrite-mode) ; [Ins]

;; (global-set-key [f6] 'calendar)

;;; DICTIONARY
;(load "dictionary-init")
;; key bindings
;(global-set-key "\C-cs" 'dictionary-search)
;(global-set-key "\C-cm" 'dictionary-match-words)
;; global dictionary-mode
;(global-dictionary-tooltip-mode)
;(setq ispell-dictionary "american")
