;; http://soundandcomplete.com/2010/05/13/emacs-as-the-ultimate-latex-editor/
;; http://alexkrispin.wordpress.com/2010/10/25/writing-with-emacs-and-auctex-part-1/
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'flymake)

(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
(add-hook 'LaTeX-mode-hook 'flymake-mode)
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)
