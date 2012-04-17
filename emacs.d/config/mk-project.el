(require 'mk-project)

(defun my-sirius-project-startup ()
  (cd (concat clojure-project-dir "/sirius"))
  (clojure-jack-in))

(defun my-sirius-project-shutdown ()
  (slime-disconnect))

(setq mk-proj-use-ido-selection t)
;;projects
(project-def "sirius"
             `((basedir          ,(concat clojure-project-dir "/sirius"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#" "*.xml"))
               (tags-file        ,(concat clojure-project-dir "/sirius/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/sirius-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/sirius-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-sirius-project-startup)
               (shutdown-hook    my-sirius-project-shutdown)))

(defun my-cornucopia-startup ()
  (cd (concat rails-project-dir "/Cornucopia")))

(project-def "cornucopia"
             `((basedir ,(concat rails-project-dir "/Cornucopia"))
               (src-patterns ("*.rb"))
               (ignore-patterns ("*.log"))
               (tags-file ,(concat rails-project-dir "/Cornucopia/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/cornucopia-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/sirius-open-files")
               (vcs git)
               (ack-args "--ruby")
               (compile-cmd "bundle install")
               (startup-hook my-cornucopia-startup)))

(defun my-timesheet-startup ()
  (cd (concat js-project-dir "/timesheet")))

(project-def "timesheet"
             `((basedir ,(concat js-project-dir "/timesheet"))
               (src-patterns ("*.js"))
               (ignore-patterns ("*.min.js"))
               (tags-file ,(concat rails-project-dir "/timesheet/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/timesheet-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/timesheet-open-files")
               (vcs git)
               (ack-args "--js")
               (startup-hook my-timesheet-startup)))
