;; w3m usage
(add-to-list 'load-path "/usr/local/bin/")
(live-add-pack-lib "w3m")
(require 'w3m)
(require 'w3m-load)

(setq browse-url-browser-function 'w3m-browse-url)
;; (setf w3m-image-viewer "open")
;(global-set-key [f3] 'browse-url-at-point)
(setq w3m-home-page "http://www.google.com")

;; (eval-after-load "dired"
;;   '(define-key dired-mode-map [f11] 'dired-w3m-find-file))

;; (defun dired-w3m-find-file ()
;;   (interactive)
;;   (require 'w3m)
;; ;;  (let ((file (dired-get-filename)))
;;    (if (y-or-n-p (format "Use emacs-w3m to browse %s? "
;;                          (file-name-nondirectory file)))
  ;; (let ((file (dired-get-filename)))
  ;;   (if (file-name-nondirectory file)
  ;;       (w3m-find-file file))))
