(add-themes-path "emacs-color-theme-solarized")
(load-library "color-theme-solarized")
(color-theme-solarized-light)

(set-face-background 'region "#93a1a1")
(global-set-key (kbd "C-c l") 'color-theme-solarized)
