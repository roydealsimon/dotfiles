;; HELP: C-c p C-h
;; location of bookmark file: set via Options -> Custom Emacs -> projectile-known-projects-file
(live-add-pack-lib "projectile")
(require 'projectile)

(projectile-global-mode) ; enable globally
;; (add-hook 'ruby-mode-hook 'projectile-on)

;; IGNORE
;; add to local .projectile
