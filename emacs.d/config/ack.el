;; https://github.com/jhelwig/ack-and-a-half
(require 'ack-and-a-half)
(autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
(autoload 'ack-and-a-half "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
;;
;; Run `ack' to search for all files and `ack-same' to search for
;; files of the same type as the current buffer.
;;
;; `next-error' and `previous-error' can be used to jump to the
;; matches.
;;
;; `ack-find-file' and `ack-find-same-file' use ack to list the files
;; in the current project.  It's a convenient, though slow, way of
;; finding files.


;;add ack searching (http://betterthangrep.com/)
;(autoload 'ack-same "full-ack" nil t)
;(autoload 'ack "full-ack" nil t)
;(autoload 'ack-find-same-file "full-ack" nil t)
;(autoload 'ack-find-file "full-ack" nil t)
