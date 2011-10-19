;; http://jblevins.org/projects/deft/
(when (require 'deft nil 'noerror)
   (setq
      deft-extension "org"
      deft-directory (concat dropbox-tools-dir "/Deft/")
      deft-text-mode 'org-mode))
