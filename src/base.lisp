(defpackage :asdf-linguist
  (:use :cl :asdf))
(in-package :asdf-linguist)

(defun run-command (format-string &rest args)
  (let ((out (apply #'format (cons nil (cons format-string args)))))
    (print out)
    (inferior-shell:run out)))

(defun output-pathname (component &optional output-type
                                    (name (pathname-name (component-pathname component))))
  (make-pathname
   :name (if (slot-boundp component 'output) (output component) name)
   :type output-type
   :defaults (component-pathname component)))

(defmacro define-component (name &key input-type output-type compile-function)
  "Define an ASDF component."
  `(progn
     (defclass ,name (source-file)
       ((type :initform ,input-type)
        (output :reader output :initarg :output)))

     (defmethod perform ((o load-op) (component ,name)) t)

     (defmethod output-files ((operation compile-op) (component ,name))
       (list
        (output-pathname component ,output-type)))

     (defmethod perform ((o compile-op) (component ,name))
       (funcall ,compile-function
                (component-pathname component)
                (output-pathname component ,output-type)))

     (import ',name :asdf)))

(defmacro define-shell-component (name &key input-type output-type command-format)
  "Define an ASDF component that's compiled by running a shell command."
  `(define-component ,name
     :input-type ,input-type
     :output-type ,output-type
     :compile-function (lambda (input-pathname output-pathname)
                         (run-command ,command-format
                                      (namestring input-pathname)
                                      (namestring output-pathname)))))
