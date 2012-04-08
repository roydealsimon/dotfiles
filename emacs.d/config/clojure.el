;; inferior lisp mode: http://dev.clojure.org/display/doc/Getting+Started+with+Emacs

;; Fix the PATH so Emacs can find elein
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path))

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'rainbow-parens)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-paren-mode)

(setq hl-paren-colors '("red1" "purple" "slateblue1" "green1" "cyan1" "magenta1" "orange1" "yellow1" ))

;; Funky Chars
(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))
;; fix indentation
(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (describe 'defun)
     (testing 'defun)
     (given 'defun)
     (using 'defun)
     (with 'defun)
     (it 'defun)
     (do-it 'defun)))

;; Custom Hooks
(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

;; (when (require 'rainbow-delimiters nil 'noerror)
;;   (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

;;command to align let statements
;;To use: M-x align-cljlet
(add-lib-path "align-cljlet")
(require 'align-cljlet)

;;;; CLOJURESCRIPT
;;;; https://github.com/brentonashworth/one/wiki/Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow input to be sent to somewhere other than inferior-lisp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is a total hack: we're hardcoding the name of the shell buffer
(defun shell-send-input (input)
  "Send INPUT into the *shell* buffer and leave it visible."
  (save-selected-window
    (switch-to-buffer-other-window "*shell*")
    (goto-char (point-max))
    (insert input)
    (comint-send-input)))

(defun defun-at-point ()
  "Return the text of the defun at point."
  (apply #'buffer-substring-no-properties
         (region-for-defun-at-point)))

(defun region-for-defun-at-point ()
  "Return the start and end position of defun at point."
  (save-excursion
    (save-match-data
      (end-of-defun)
      (let ((end (point)))
        (beginning-of-defun)
        (list (point) end)))))

(defun expression-preceding-point ()
  "Return the expression preceding point as a string."
  (buffer-substring-no-properties
   (save-excursion (backward-sexp) (point))
   (point)))

(defun shell-eval-last-expression ()
  "Send the expression preceding point to the *shell* buffer."
  (interactive)
  (shell-send-input (expression-preceding-point)))

(defun shell-eval-defun ()
  "Send the current toplevel expression to the *shell* buffer."
  (interactive)
  (shell-send-input (defun-at-point)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "C-c e") 'shell-eval-last-expression)
             (define-key clojure-mode-map (kbd "C-c x") 'shell-eval-defun)))
