(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; add to project/plugins.sbt
;; addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "0.1.0")
;; ensime generate

(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
            '(lambda ()
               (scala-mode-feature-electric-mode)))
