;; M-x run-scheme
;; http://bc.tech.coop/scheme/_emacs
;; http://www.neilvandyke.org/racket/
(require 'quack)
;;         C-c C-q m   View a manual in your Web browser.
;;         C-c C-q k   View the manual documentation for a keyword
;;                     (currently only works for PLT manuals).
;;         C-c C-q s   View an SRFI.
;;         C-c C-q r   Run an inferior Scheme process.
;;         C-c C-q f   Find a file using context of point for default.
;;         C-c C-q l   Toggle `lambda' syntax of `define'-like form.
;;         C-c C-q t   Tidy the formatting of the buffer.

;; http://www.nongnu.org/geiser/geiser_2.html#Installation
;; M-x run-geiser
;; http://nschum.de/src/emacs/company-mode/
;; (setq geiser-impl-installed-implementations '(racket))
;;(require 'geiser-install)


;; SCIP
;; brew install mit-scheme
;; sudo ln -s /Applications/mit-scheme.app/Contents/Resources/mit-scheme /usr/local/bin/scheme
;; (setenv "MITSCHEME_LIBRARY_PATH" "/Applications/mit-scheme.app/Contents/Resources")


(require 'rainbow-delimiters)
(require 'rainbow-parens)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-paren-mode)
