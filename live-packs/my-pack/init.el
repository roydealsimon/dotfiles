;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

(setq my-pack-dir (concat (getenv "HOME") "/.live-emacs/my-pack/"))
(setq my-pack-etc (concat my-pack-dir "etc/"))

;; Load bindings config
(live-load-config-file "bookmarks.el")
(live-load-config-file "projectile.el")

;; ack, ctags, backup, bindings, maxframe
;; ibuffer, ido, isearch

;; (live-load-config-file "default.el")
;; (live-load-config-file "bindings.el")
