;; http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/
;; js2 proper indentation: http://yoo2080.wordpress.com/2012/03/15/install-and-use-the-mooz-fork-of-js2-mode/
;; emacs --batch -f batch-byte-compile js2.el

;; js-mode (espresso)
;; Espresso mode has sane indenting so we use that.
(setq js-indent-level 4)

;; JS2-Mode
(autoload 'js2-mode "js2" nil t)
(setq js2-basic-offset 4) ; javascript standard is 4
(setq js2-cleanup-whitespace t)

;; Custom indentation function since JS2 indenting is terrible.
;; Uses js-mode's (espresso-mode) indentation semantics.
;;
;; Based on: http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; (Thanks!)
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)
      (save-excursion
        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ js-indent-level 2))))
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))
      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-jslint ()
  (interactive)
  (compile (format "jsl -process %s" (buffer-file-name))))

;; TODO: sending to rhino doesn't work properly
;; (require 'js-comint)
;; (setq inferior-js-program-command "java -jar /usr/local/Cellar/rhino/1.7R3/libexec/js.jar")

;;   (local-set-key "\C-x\C-e" 'js-send-last-sexp)
;;   (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;;   (local-set-key "\C-cb" 'js-send-buffer)
;;   (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;;   (local-set-key "\C-cl" 'js-load-file-and-go)

(defun my-js-mdn ()
  (interactive)
  (browse-url "https://developer.mozilla.org/en/JavaScript/Reference"))

(defun my-js2-mode-hook ()
  (if (not (boundp 'js--proper-indentation))
      (progn (js-mode)
             (remove-hook 'js2-mode-hook 'my-js2-mode-hook)
             (js2-mode)
             (add-hook 'js2-mode-hook 'my-js2-mode-hook)))
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control c) (control l)] 'my-jslint)
  (define-key js2-mode-map [(control c) (control d)] 'my-js-mdn)
  (message "JS2 mode hook ran."))

;; Add the hook so this is all loaded when JS2-mode is loaded
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
;; (add-hook 'js2-mode-hook '(lambda ()
;;                               ;; scan the file for nested code blocks
;;                              (imenu-add-menubar-index)
;;                              ;; activate folding mode
;;                              (hs-minor-mode t)))


;;;;;;;;;;;;;;;;;;;;;

(require 'coffee-mode)

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 4)
  (define-key coffee-mode-map [(alt r)] nil)
  (define-key coffee-mode-map [(alt R)] nil)
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  (define-key coffee-mode-map [(meta R)] 'coffee-compile-region)
  (define-key coffee-mode-map [(control c) (control j)] 'coffee-repl)
  ;; compile .coffee files on every save - compile-on-save: C-c C-o C-s
  (and (file-exists-p (buffer-file-name))
       (file-exists-p (coffee-compiled-file-name))
       (coffee-cos-mode t)))

(add-hook 'coffee-mode-hook '(lambda() (coffee-custom)))
