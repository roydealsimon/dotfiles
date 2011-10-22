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
