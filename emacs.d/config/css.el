(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

(add-hook 'css-mode-hook '(lambda ()
                            (setq css-indent-level 4)
                            (setq css-indent-offset 4)))
