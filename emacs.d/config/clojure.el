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

;(setq hl-paren-colors '("red1" "purple" "slateblue1" "green1" "cyan1" "magenta1" "orange1" "yellow1" ))

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
