(require 'org-install)

(setq org-startup-indented t)
(setq org-log-done 'time) ;; timestamp done, use 'l' in timeline/agenda to view these
;(setq org-log-done 'note) ;; record a note along with timestamp
(setq org-clock-idle-time 10) ;; resolve idle time (in minutes)

(setq org-clock-persist 'history) ;; for clocking work time
(org-clock-persistence-insinuate)

(setq org-log-into-drawer "LOGBOOK")
(setq org-agenda-columns-add-appointments-to-effort-sum t)

(setq org-default-notes-file (concat dropbox-tools-dir "/Org/notes.org"))


(defun org-summary-todo (n-done n-not-done)
       "Switch entry to DONE when all subentries are done, to TODO otherwise."
       (let (org-log-done org-log-states)   ; turn off logging
         (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(add-hook 'org-load-hook
            (lambda ()
              (define-key org-mode-map "\C-n" 'org-next-link)
              (define-key org-mode-map "\C-p" 'org-previous-link)))

;; custom workflow
;; shortcut: t, d, r, b, k, f, c...
;; ! add timestamp, @ add note, / when leaving state
 (setq org-todo-keywords
           '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")
             (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))

;;      (setq org-todo-keyword-faces
;;            '(("TODO" . org-warning) ("STARTED" . "yellow")
;;              ("CANCELED" . (:foreground "blue" :weight bold))))

;; ;; (setq org-todo-keywords
;; '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
