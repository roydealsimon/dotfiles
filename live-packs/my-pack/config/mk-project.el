(require 'mk-project)

(defun my-project-shutdown ()
  (cd (getenv "HOME")))

(defun my-trans5-project-startup ()
  (cd (concat clojure-project-dir "/trans5"))
  (clojure-jack-in))

(defun my-closetta-project-startup ()
  (cd (concat clojure-project-dir "/closetta"))
  (clojure-jack-in))

(defun my-flip-project-startup ()
  (cd (concat clojure-project-dir "/flip"))
  (clojure-jack-in))

(defun my-barogue-project-startup ()
  (cd (concat clojure-project-dir "/barogue"))
  (clojure-jack-in))

(defun my-clojure-project-shutdown ()
  (slime-disconnect)
  (my-project-shutdown))

(setq mk-proj-use-ido-selection t)
;;projects
(project-def "trans5"
             `((basedir          ,(concat clojure-project-dir "/trans5"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#" "*.xml"))
               (tags-file        ,(concat clojure-project-dir "/trans5/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/trans5-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/trans5-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-trans5-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))

(project-def "closetta"
             `((basedir          ,(concat clojure-project-dir "/closetta"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#" "*.xml"))
               (tags-file        ,(concat clojure-project-dir "/closetta/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/closetta-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/closetta-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-closetta-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))

(project-def "flip"
             `((basedir          ,(concat clojure-project-dir "/flip"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#" "*.xml"))
               (tags-file        ,(concat clojure-project-dir "/flip/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/flip-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/flip-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-flip-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))

(project-def "barogue"
             `((basedir          ,(concat clojure-project-dir "/barogue"))
               (src-patterns     ("*.clj" "*.stg"))
               (ignore-patterns  ("*.class" "*.log" "*#" "*.xml"))
               (tags-file        ,(concat clojure-project-dir "/barogue/TAGS"))
               (file-list-cache  "/Users/roy/.emacs.d/tmp/mk-project-cache/barogue-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/barogue-open-files")
               (vcs              git)
               (ack-args         "--clojure")
;               (compile-cmd      "lein compile")
               (startup-hook     my-barogue-project-startup)
               (shutdown-hook    my-clojure-project-shutdown)))


(defun my-cornucopia-startup ()
  (cd (concat rails-project-dir "/Cornucopia")))

(project-def "cornucopia"
             `((basedir ,(concat rails-project-dir "/Cornucopia"))
               (src-patterns ("*.rb"))
               (ignore-patterns ("*.log"))
;               (tags-file ,(concat rails-project-dir "/Cornucopia/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/cornucopia-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/cornucopia-open-files")
               (vcs git)
               (ack-args "--ruby")
               (compile-cmd "bundle install")
               (startup-hook my-cornucopia-startup)
               (shutdown-hook my-project-shutdown)))

(defun my-timesheet-startup ()
  (cd (concat js-project-dir "/timesheet")))

(defun my-openroad-startup ()
  (cd (concat js-project-dir "/openroad")))


(defun my-shorty-startup ()
  (cd (concat js-project-dir "/shorty")))

(project-def "timesheet"
             `((basedir ,(concat js-project-dir "/timesheet"))
               (src-patterns ("*.js"))
               (ignore-patterns ("*.min.js"))
;               (tags-file ,(concat js-project-dir "/timesheet/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/timesheet-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/timesheet-open-files")
               (vcs git)
               (ack-args "--js")
               (startup-hook my-timesheet-startup)
               (shutdown-hook my-project-shutdown)))

(project-def "openroad"
             `((basedir ,(concat js-project-dir "/openroad"))
               (src-patterns ("*.js"))
               (ignore-patterns ("*.min.js"))
;               (tags-file ,(concat js-project-dir "/openroad/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/openroad-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/openroad-open-files")
               (vcs git)
               (ack-args "--js")
               (startup-hook my-openroad-startup)
               (shutdown-hook my-project-shutdown)))


(project-def "shorty"
             `((basedir ,(concat js-project-dir "/shorty"))
               (src-patterns ("*.js"))
               (ignore-patterns ("*.min.js"))
;               (tags-file ,(concat js-project-dir "/timesheet/TAGS"))
               (file-list-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/shorty-files")
               (open-files-cache "/Users/roy/.emacs.d/tmp/mk-project-cache/shorty-open-files")
               (vcs git)
               (ack-args "--js")
               (startup-hook my-shorty-startup)
               (shutdown-hook my-project-shutdown)))
