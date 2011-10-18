(defun my-clojure-project-startup ()
  (clojure-jack-in))

(defun my-clojure-project-shutdown ()
  (slime-disconnect))

(setq mk-proj-use-ido-selection t)
;;projects
(project-def "consolidator"
             `((basedir          ,(concat clojure-project-dir "/consolidator"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#"))
               (tags-file        ,(concat clojure-project-dir "/consolidator/tmp/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/consolidator-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/consolidator-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-clojure-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))
