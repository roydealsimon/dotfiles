(require 'color-theme)

;; Move emacs customizations out of init.el and into a separate file
(setq custom-file (concat dotfiles-config-themes-dir "custom.el"))
(load custom-file 'noerror)

(if (window-system) (set-face-attribute 'default nil :font "Monaco-18"))


(load-themes-config "solarized-conf.el")
;; (load-themes-config "livecode-conf.el")

;; (load-themes-config "billw-conf.el")
;; (load-themes-config "twilight-conf.el")
;; (load-themes-config "zenburn-conf.el")

(setq my-themes '("solarized-conf.el"
                  "livecode-conf.el"
                  "billw-conf.el"
                  "twilight-conf.el"
                  "zenburn-conf.el"))
(defun my-theme-set-default ()        ; Set the first row
  (interactive)
  (setq theme-current my-themes)
  (load-themes-config (car theme-current)))

(defun my-describe-theme ()        ; Show the current theme
  (interactive)
  (message "%s" (car theme-current)))

(defun my-theme-cycle ()
  (interactive)
  (setq theme-current (cdr theme-current))
  (if (null theme-current)
      (setq theme-current my-themes))
  (load-themes-config (car theme-current))
  (message "%S" (car theme-current)))

(setq theme-current my-themes)
(my-theme-set-default)
