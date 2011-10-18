;; http://www.gnu.org/software/emacs/manual/html_mono/flymake.html
(require 'flymake)

(global-set-key [f3] 'flymake-display-err-menu-for-current-line)
(global-set-key [f4] 'flymake-goto-next-error)

(add-hook 'find-file-hook 'flymake-find-file-hook)

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)

;; RUBY
(require 'flymake-ruby)
;; http://www.emacswiki.org/emacs/FlymakeRuby
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()
	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))

;; ERB
(defun flymake-erb-init ()
  (let* ((check-buffer (current-buffer))
         (temp-file (flymake-create-temp-inplace (buffer-file-name) "flymake"))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (save-excursion
      (save-restriction
        (widen)
        (with-temp-file temp-file
          (let ((temp-buffer (current-buffer)))
            (set-buffer check-buffer)
            (call-process-region (point-min) (point-max) "erb" nil temp-buffer nil "-x"))))
      (setq flymake-temp-source-file-name temp-file)
      (list "ruby" (list "-c" local-file)))))

(eval-after-load "flymake"
  '(progn
     (push '(".+\\.\\(rhtml\\|erb\\)$" flymake-erb-init) flymake-allowed-file-name-masks)
     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)))

(defun turn-on-flymake-for-erb-files ()
  (when (string-match "\.erb$" (buffer-file-name))
    (flymake-mode 1)))
(add-hook 'find-file-hook 'turn-on-flymake-for-erb-files)

;; COFFEE
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; HAML
(require 'flymake-haml)
(add-hook 'haml-mode-hook 'flymake-haml-load)

;; SASS
(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)

;; JSLINT
;; http://www.emacswiki.org/emacs/FlymakeJavaScript
;; npm -g install jslint
;(require 'flymake-jslint)
;(defun flymake-jslint-init ()
;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;		       'flymake-create-temp-inplace))
;           (local-file (file-relative-name
;                        temp-file
;                        (file-name-directory buffer-file-name))))
;      (list "jslint" (list local-file))))
;
;(setq flymake-err-line-patterns
;	(cons '("^  [[:digit:]]+ \\([[:digit:]]+\\),\\([[:digit:]]+\\): \\(.+\\)$"
;		nil 1 2 3)
;	      flymake-err-line-patterns))
;
;  (add-to-list 'flymake-allowed-file-name-masks
;               '("\\.js\\'" flymake-jslint-init)))
;
;(add-hook 'javascript-mode-hook
;	  (lambda () (flymake-mode t)))


;; SHELL
(require 'flymake-shell)
(add-hook 'sh-mode-hook 'flymake-shell-load)
