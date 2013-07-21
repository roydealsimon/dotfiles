(defun finder (location)
  "Fire up finder in a location relative to pwd."
  (interactive "sOpen finder at this location (relative to pwd): ")
  (start-process "finder" "finder" "open" "-a" "Finder.app" location))

(global-set-key (kbd "C-c f") 'finder)


;;

(require 'todochiku)

(defun highlight-me (match-type nick message)
  (unless (posix-string-match "^\\** Users on #" message)
    (todochiku-message
     (concat "ERC: Highlight on " (buffer-name (current-buffer)))
     (concat "<" (first (split-string nick "!")) "> " message)
     "")))

(add-hook 'erc-text-matched-hook 'highlight-me)
(add-hook 'erc-text-matched-hook 'erc-beep-on-match)

(setq erc-track-exclude-types
      '("JOIN" "NICK" "PART" "QUIT" "MODE" "KICK"
        "324" "329" "332" "333" "353" "477")
      erc-track-switch-direction 'newest
      erc-log-channels-directory "~/.erc/logs/"
      znc-servers (read (get-string-from-file "~/.ercznc")))

(erc-spelling-mode 1)
(erc-log-mode 1)


(defun current-itunes-song ()
  (do-applescript
   "tell application \"iTunes\"
       set artist_name to the artist of the current track
       set song_title to the name of the current track
       set song_album to the album of the current track
       set song_length to the time of the current track
       set played_count to the played count of the current track
       return song_title & \" - \" & artist_name & \" [\" & song_album & \"] [length: \" & song_length & \"] [played: \" & played_count & \"]\"
    end tell"))

(defun erc-cmd-NP ()
  (erc-cmd-ME (concat " is listening to " (current-itunes-song))))

(defun PRIVMSG-notify (proc parsed)
  (let ((nick (car (erc-parse-user (erc-response.sender parsed))))
        (target (car (erc-response.command-args parsed)))
        (msg (erc-response.contents parsed)))
    (when (and (erc-current-nick-p target)
               (not (erc-is-message-ctcp-and-not-action-p msg)))
      (todochiku-message
       (concat "ERC: Direct message from " nick)
       msg
       ""))))

(add-hook 'erc-server-PRIVMSG-functions 'PRIVMSG-notify)

;;; erc

(setq erc-prompt ">"
      erc-fill-column 75
      ;; rcirc's omit-mode is way better than this =\
      erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
      erc-track-exclude-types (append '("324" "329" "332" "333"
                                        "353" "477" "MODE")
                                      erc-hide-list)
      erc-autojoin-timing :ident
      erc-flood-protect nil
      erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#clojure" "#leiningen" "#seajure"))
      erc-prompt-for-nickserv-password nil)

(setq-default erc-ignore-list '("Lajla" "pjb" "e1f"))

(eval-after-load 'erc
  '(progn
     (when (not (package-installed-p 'erc-hl-nicks))
       (package-install 'erc-hl-nicks))
     (require 'erc-spelling)
     (require 'erc-services)
     (require 'erc-truncate)
     (require 'erc-hl-nicks)
     (erc-services-mode 1)
     (add-to-list 'erc-modules 'hl-nicks)
     (add-to-list 'erc-modules 'spelling)
     (set-face-foreground 'erc-input-face "dim gray")
     (set-face-foreground 'erc-my-nick-face "blue")))

;;

(load "~/.ercpass")
(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      `((freenode     (("samaaron" . ,freenode-pass)))))

;;IRC
(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#clojure" "#overtone" "#leiningen" "#quil")))

(defun erc-connect ()
  "Start up erc and connect to freedonde"
  (interactive)
  (erc :server "irc.freenode.net" :full-name "Sam Aaron" :port 6667 :nick "samaaron"))

(require 'erc-match)
(setq erc-keywords '("samaaron" "overtone" "osc-clj" "supercollider" "monome" "touchosc"))
(erc-match-mode)

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (let* ((process (start-process "growlnotify" nil
                                   growlnotify-command
                                   (encfn title)
                                   "-a" "Emacs"
                                   "-n" "Emacs")))
      (process-send-string process (encfn message))
      (process-send-string process "\n")
      (process-send-eof process)))
  t)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)

;;change wrap width when window is resized
(make-variable-buffer-local 'erc-fill-column)
 (add-hook 'window-configuration-change-hook
           '(lambda ()
              (save-excursion
                (walk-windows
                 (lambda (w)
                   (let ((buffer (window-buffer w)))
                     (set-buffer buffer)
                     (when (eq major-mode 'erc-mode)
                       (setq erc-fill-column (- (window-width w) 2)))))))))

;;

(defvar growlnotify-command (executable-find "growlnotify") "/usr/local/bin/growlnotify")

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (let* ((process (start-process "growlnotify" nil
                                   growlnotify-command
                                   (encfn title)
                                   "-a" "Emacs"
                                   "-n" "Emacs")))
      (process-send-string process (encfn message))
      (process-send-string process "\n")
      (process-send-eof process)))
  t)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)

;;

;;;;;;

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




;;


(require 'twittering-mode)

(setq twittering-use-master-password t
      twittering-tinyurl-service 'bit.ly
      twittering-bitly-login "raynes"
      twittering-bitly-api-key (get-string-from-file "~/.bitly"))

(add-hook 'twittering-edit-mode-hook
          (lambda ()
            (ispell-minor-mode)
            (flyspell-mode)))

(add-hook 'twittering-new-tweets-hook
          (lambda ()
            (let ((n twittering-new-tweets-count)
                  (spec (twittering-timeline-spec-to-string twittering-new-tweets-spec)))
              (when (string= ":mentions" spec)
                (if (> n 10)
                    (todochiku-message
                     "Twittering"
                     (format "%d new mention(s)" n)
                     "")
                  (dolist (tweet twittering-new-tweets-statuses)
                    (todochiku-message
                     "Twittering"
                     (concat (cdr (assoc 'user-screen-name tweet))
                             " said: "
                             (cdr (assoc 'text tweet)))
                     "")))))))


;;

;; resizing 'windows' (i.e., inside the frame)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key [(meta control up)] 'enlarge-window)
(global-set-key [(meta control down)] 'shrink-window)
(global-set-key [(meta shift right)] 'enlarge-window-horizontally)
(global-set-key [(meta shift left)] 'shrink-window-horizontally)

;;shrink and grow windows horizontally and vertically
(global-set-key (kbd "C-c .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c '") (lambda () (interactive) (enlarge-window 1)))

;; Textmate minor-mode keybinds
(global-set-key [(meta shift t)] 'textmate-goto-file)
(global-set-key [(meta shift d)] 'textmate-goto-symbol)
(global-set-key [(meta up)] 'textmate-column-up)
(global-set-key [(meta down)] 'textmate-column-down)
(global-set-key [(meta shift up)] 'textmate-column-up-with-select)
(global-set-key [(meta shift down)] 'textmate-column-down-with-select)

(add-to-list 'auto-mode-alist '("profile" . shell-script-mode))

;;;

(mapcar (lambda (x) (add-to-list 'load-path (expand-file-name x)))
        '("~/.emacs.d"
          "~/.emacs.d/clojure-mode"
          "~/.emacs.d/slime"
          "~/.emacs.d/swank-clojure-extra"
          "~/.emacs.d/haskell-mode"
          "~/.emacs.d/org/lisp"
          "~/.emacs.d/org/contrib/lisp"))

(defun require-all (packages)
    (mapcar #'require packages))

(require-all '(
               mwe-log-commands
               uniquify
               light-symbol
               linum
               color-theme
               gentooish
               ido
               parenface
               point-undo
               bar-cursor
               browse-kill-ring
               smart-tab
               clojure-test-mode
               undo-tree
               ))
(defun code-mode (x)
  (mapcar (lambda (hook) (add-hook hook x))
          '(ruby-mode
            clojure-mode-hook
            lisp-mode-hook
            slime-repl-mode-hook
            emacs-lisp-mode-hook)))

;;;;
; Dired
(require 'dired)

; remap 'o' in dired mode to open a file
(defun dired-open-mac ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (call-process "/usr/bin/open" nil 0 nil file-name))))
(define-key dired-mode-map "o" 'dired-open-mac)

; - is `cd ..` (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)

; prefer dired over dumping dir list to buffer
(global-set-key "\C-x\C-d" 'dired)

;;;;

; js2
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; js-shell
(autoload 'javascript-shell "javascript-mode" nil t)

(defun js2-insert-console ()
  (interactive)
  (insert "console.log()")
  (backward-char))

(defun js2-execute-buffer ()
  (interactive)
  (shell-command (concat "node " (buffer-file-name))))

(defun js2-execute-line ()
  (interactive)
  (save-excursion
    (call-process-region (point-at-bol)
                         (point-at-eol)
                         "johnson"
                         nil
                         (get-buffer-create "*johnson-line*"))
    (with-current-buffer (get-buffer "*johnson-line*")
      (search-backward "\n\n" nil t)
      (replace-match "" nil t)
      (message (buffer-string))
      (kill-buffer nil))))

(add-hook 'js2-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook 'delete-trailing-whitespace)
             (define-key js2-mode-map (kbd "A-r") 'js2-execute-buffer)
             (define-key js2-mode-map (kbd "A-R") 'js2-execute-line)
             (define-key js2-mode-map "\C-L" 'js2-insert-console)
             (defun js-continued-var-decl-list-p ()
               "Return non-nil if point is inside a continued variable declaration
list."
               (interactive)
               (let ((start (save-excursion (js-re-search-backward "\\<var\\>" nil t))))
                 (and start
                      (save-excursion (re-search-backward "\n" start t))
                      (not (save-excursion
                             (js-re-search-backward
                              ";\\|[^, \t][ \t]*\\(/[/*]\\|$\\)" start t))))))
             (defun js-proper-indentation (parse-status)
             "Return the proper indentation for the current line."
             (save-excursion
               (back-to-indentation)
               (let ((ctrl-stmt-indent (js-ctrl-statement-indentation))
                     (same-indent-p (looking-at "[]})]\\|\\<case\\>\\|\\<default\\>"))
                     (continued-expr-p (js-continued-expression-p)))
                 (cond (ctrl-stmt-indent)
                       ((js-continued-var-decl-list-p)
                        (js-re-search-backward "\\<var\\>" nil t)
                        (+ (current-indentation) js2-basic-offset))
                       ((nth 1 parse-status)
                        (goto-char (nth 1 parse-status))
                        (if (looking-at "[({[][ \t]*\\(/[/*]\\|$\\)")
                            (progn
                              (skip-syntax-backward " ")
                              (when (= (char-before) ?\)) (backward-list))
                              (back-to-indentation)
                              (cond (same-indent-p
                                     (current-column))
                                    (continued-expr-p
                                     (+ (current-column) (* 2 js2-basic-offset)))
                                    (t
                                     (+ (current-column) js2-basic-offset))))
                          (unless same-indent-p
                            (forward-char)
                            (skip-chars-forward " \t"))
                          (current-column)))
                       (continued-expr-p js2-basic-offset)
                       (t 0)))))))

;;;;

; rinari
(vendor 'rinari)
(setq rinari-tags-file-name "TAGS")
(add-hook 'rinari-minor-mode-hook
          (lambda ()
            (define-key rinari-minor-mode-map (kbd "A-r") 'rinari-test)))

; rhtml
(setq auto-mode-alist (cons '("\\.html\\.erb" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb" . nxml-mode) auto-mode-alist))

; ruby
(vendor 'ruby-hacks)
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.god" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))

;; no warnings when compiling
(setq ruby-dbg-flags "")

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max)))))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (define-key ruby-mode-map "\C-m" 'ruby-reindent-then-newline-and-indent)
            (require 'ruby-electric)
            (ruby-electric-mode t)))

(defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
  (let ((comp-buffer-name (format "*%s*" name)))
    (when (get-buffer comp-buffer-name)
      (kill-buffer comp-buffer-name))))
(ad-activate 'ruby-do-run-w/compilation)

; where'd this go?
(defun ruby-reindent-then-newline-and-indent ()
  "Reindents the current line then creates an indented newline."
  (interactive "*")
  (newline)
  (save-excursion
    (end-of-line 0)
    (indent-according-to-mode)
    (delete-region (point) (progn (skip-chars-backward " \t") (point))))
  (when (ruby-previous-line-is-comment)
      (insert "# "))
  (indent-according-to-mode))

(defun ruby-previous-line-is-comment ()
  "Returns `t' if the previous line is a Ruby comment."
  (save-excursion
    (forward-line -1)
    (ruby-line-is-comment)))

(defun ruby-line-is-comment ()
  "Returns `t' if the current line is a Ruby comment."
  (save-excursion
    (beginning-of-line)
    (search-forward "#" (point-at-eol) t)))

; treetop
(vendor 'treetop)

;;;;

;; Open a browser page for the url at point.
(global-set-key (kbd "C-c C-o") 'browse-url-at-point)

;;;

;; Indent the whole buffer.
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;;;;

;;; frames
(setq initial-frame-alist '((top . 0)
                            (left . 0)
                            (width . 155)
                            (height . 50)))
(setq frame-title-format "%b")
(setq icon-title-format  "%b")

;;;;

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
