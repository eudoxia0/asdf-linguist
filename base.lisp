(defpackage :asdf-linguist
  (:use :cl :asdf))
(in-package :asdf-linguist)

(defun run (format-string &rest args)
  (let ((out (apply #'format (cons nil (cons format-string args)))))
    (print out)
    (run-shell-command out)))

(defun out (component &optional output-type (name (pathname-name (component-pathname component))))
  (make-pathname
   :name (if (slot-boundp component 'output) (output component) name)
   :type output-type
   :defaults (component-pathname component)))

(defmacro simple (name input-type output-type command-format)
  `(progn
     (defclass ,name (source-file)
       ((type :initform ,input-type)
        (output :reader output :initarg :output)))

     (defmethod perform ((o load-op) (component ,name)) t)

     (defmethod output-files ((operation compile-op) (component ,name))
       (values
        (list
         (out component ,output-type))))

     (defmethod perform ((o compile-op) (component ,name))
       (run ,command-format
            (namestring (component-pathname component))
            (namestring (out component ,output-type))))

     (import ',name :asdf)))
