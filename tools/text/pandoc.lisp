(in-package :asdf-linguist)

(defclass pandoc (source-file)
  ((type :initarg :type :reader input-type)
   (input-format :initarg :input-type :reader input-format)
   (output :initarg :output :reader output)
   (output-type :initarg :output-type :reader output-type :initform nil)
   (output-extension :initarg :output-extension :reader output-extension)
   (options :initarg :options :reader options :initform "")))

(defmethod perform ((o load-op) (component pandoc)) nil)

(defmethod output-files ((operation compile-op) (component pandoc))
  (list
   (out component (output-extension component))))

(defmethod perform ((o compile-op) (component pandoc))
  (run "pandoc ~A -f ~A -o ~A ~A ~A"
       (if (output-type component)
           (concatenate 'string "-t " (output-type component))
           "")
       (input-format component)
       (namestring (out component (output-extension component)))
       (namestring (component-pathname component))
       (options component)))

(import 'pandoc :asdf)
