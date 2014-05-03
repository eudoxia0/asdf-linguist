(in-package :asdf-linguist)

(defclass pandoc (source-file)
  ((type :initarg :type :reader input-type)
   (output :initarg :output :reader output)
   (output-type :initarg :output-type :reader output-type)
   (options :initarg :options :reader options :initform "")))

(defmethod perform ((o load-op) (component pandoc)) t)

(defmethod output-files ((operation compile-op) (component pandoc))
  (values
   (list
    (out component (output-type component)))))

(defmethod perform ((o compile-op) (component pandoc))
  (run "pandoc -t ~A -o ~A ~A ~A"
       (output-type component)
       (namestring (out component (output-type component)))
       (namestring (component-pathname component))
       (options component)))


(import 'pandoc :asdf)
