(defpackage :asdf-linguist
  (:use :cl :asdf))
(in-package :asdf-linguist)

(defun run (format-string &rest args)
  (let ((out (apply #'format (cons nil (cons format-string args)))))
    (print out)
    (run-shell-command out)))

(defun out (component output-type &optional (name (pathname-name (component-pathname component))))
  (make-pathname
   :name name
   :type output-type
   :defaults (component-pathname component)))
