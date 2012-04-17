;; stuff from https://github.com/mattkeller/elisp/blob/master/projects.el
(require 'ibuffer-git) ; git-status-mini, git-status columns
(require 'ibuf-ext)

(defun mk/proj-buffer-p (b)
  "Is the buffer `b' part of the project?"
  (and mk-proj-name
       (or (mk-proj-buffer-p b)
           (string= (buffer-name b) mk-proj-fib-name)
           (string= (buffer-file-name b) mk-proj-tags-file))))

(define-ibuffer-column mk-proj-col
  (:name "P")
  (if (mk/proj-buffer-p buffer) "p" ""))

;; Define 3 formats, each including the new mk-proj-p-col
;; column. Switch formats with ibuffer-switch-format (bound to "`").
(setq ibuffer-formats
      '((mark modified read-only
              (mk-proj-col 2 2 :left :elide) " "
              (name 30 30 :left :elide) " "
              (size 9 -1 :right) " "
              (mode 16 16 :left :elide) " "
              filename-and-process)
        (mark modified read-only
              (mk-proj-col 2 2 :left :elide) " "
              (name 45 -1 :left) " "
              filename-and-process)
        (mark modified read-only
              (mk-proj-col 2 2 :left :elide) " "
              filename-and-process)
        (mark modified read-only
              mk-proj-col
              git-status-mini " "
              (name 30 30 :left :elide) " "
              (mode 16 16 :left :elide) " "
              (git-status 8 8 :left) " "
              filename-and-process)))

(define-key ibuffer-mode-map (kbd "C-c C-c") 'ibuffer-switch-format)

(define-ibuffer-filter project
  "Toggle current view to buffers in the defined mk-project."
  (:description "mk-project")
  (mk/proj-buffer-p buf))

(define-key ibuffer-mode-map (kbd "/ k") 'ibuffer-filter-by-project)

(define-ibuffer-column mk-proj-name-col
  (:name "Project")
  (if (mk-proj-proj-buffer-p buffer) mk-proj-name ""))

;; C-x C-b
(setq ibuffer-saved-filter-groups
    '(("home"
       ("Emacs" (or (filename . ".emacs.d")
                    (filename . "emacs-config")
                    (filename . "packages.md")))
       ("Org" (or (mode . org-mode)
                  (filename . "OrgMode")))
       ("Web Dev" (or (mode . html-mode)
                      (mode . css-mode)))
       ("Clojure" (mode . clojure-mode))
       ("JavaScript" (or (mode . js2-mode)
                         (mode . javascript-mode)))
       ("Magit" (name . "\*magit"))
       ("ESS" (mode . ess-mode))
       ("LaTeX" (mode . latex-mode))
       ("Help" (or (name . "\*Help\*")
                   (name . "\*Apropos\*")
                   (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
                   '(lambda ()
                      (ibuffer-switch-to-saved-filter-groups "home")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "home")))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "home")))
