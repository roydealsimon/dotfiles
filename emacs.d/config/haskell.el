;; http://www.mew.org/~kazu/proj/ghc-mod/en/ghc-mod.html
;; brew install ghc --use-llvm
;; brew install haskell-platform --use-llvm
;; cabal update

;; haskell mode configuration
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; fix path issues for ghc-mod
;; (push  (concat (getenv "HOME") "/.cabal/bin") exec-path)
;; (push  "/usr/local/bin" exec-path)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"   . haskell-mode)
                ("\\.hsc$"    . haskell-mode)
                ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))

;(autoload 'haskell-mode "haskell-mode" "Major mode for editing Haskell scripts." t)
;(autoload 'literate-haskell-mode "haskell-mode" "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:
(require 'inf-haskell)

;(add-hook 'haskell-mode-hook 'turn-on-font-lock)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-decl-scan)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook
   (function
    (lambda ()
      (setq haskell-program-name "ghci")
      (setq haskell-ghci-program-name "ghci6"))))


;; only set 1 indentation mode
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;     (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
    ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
    ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; set this if you want funky Haskell symbols
;; (setq haskell-font-lock-symbols t)
