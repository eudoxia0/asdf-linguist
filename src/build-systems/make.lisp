(in-package :asdf-linguist)

(defclass make (source-file)
  ((target :reader target :initarg :target :initform "")))

(defclass make (source-file) ())

(defmethod perform ((o load-op) (component make)) t)

(defmethod perform ((o compile-op) (component make))
  (run-command "make -f ~A" (component-pathname component)))

(import 'make :asdf)
