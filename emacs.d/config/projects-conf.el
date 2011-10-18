(defun my-clojure-project-startup ()
  (clojure-jack-in))

(defun my-clojure-project-shutdown ()
  (slime-disconnect))

;;projects
(project-def "consolidator"
             '((basedir          "/Users/roy/Dropbox/Code/Clojure/consolidator")
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/consolidator-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/consolidator-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-clojure-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))
