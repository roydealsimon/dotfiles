;; CEDET
;; http://cxwangyi.wordpress.com/2010/08/21/using-cedet-with-emacs/
;; control return: whatever the symbol you are typing, this hot key automatically complete it for you.
;; C-c?: another way to complete the symbol you are typing
;; C-c>: when you typed . or -> after an object name, use this key to show possible public member functions or data members.
;; C-cj: jump to the definition of the symbol under cursor
;; C-cs: show a summary about the symbol under cursor
;; C-cq: show the document of the symbol under cursor
;; C-c=: visit the header file under cursor
;; C-cp: toggle between the implementation and a prototype of symbol under cursor
;; C-ce: when your cursor is in the scope of a class or one of its member function, list all methods in the class
;; C-cC-r: show references of the symbol under cursor
;; C-cC-c-: fold all
;; C-cC-c+: unfold all
;; C-c-: fold the block under cursor
;; C-c+: unfold the block under cursor
(require 'cedet)

(global-ede-mode 'nil)                  ; do NOT use project manager

(semantic-load-enable-excessive-code-helpers)

(require 'semantic-ia)          ; names completion and display of tags
(require 'semantic-gcc)         ; auto locate system include files

(semantic-add-system-include "~/3rd-party/boost-1.43.0/include/" 'c++-mode)
(semantic-add-system-include "~/3rd-party/protobuf-2.3.0/include" 'c++-mode)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(global-semantic-tag-folding-mode 1)

(require 'eassist)

;(concat essist-header-switches ("hh" "cc"))
(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; gnu global support
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

(global-semantic-idle-tag-highlight-mode 1)


;; byte-compile
;;    http://ecb.sourceforge.net/docs/Standard-ECB_002dInstallation.html#Standard-ECB_002dInstallation
;; use M-x ecb-activate to turn on ECB mode.
(when (not (package-installed-p 'ecb))
  (package-install 'ecb))
(when (not (package-installed-p 'ecb-autoloads))
  (package-install 'ecb-autoloads))

(require 'ecb)
(require 'ecb-autoloads)
