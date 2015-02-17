(in-package :asdf-linguist)

(defclass dot (source-file)
  ((type :initform "dot")
   (output :reader output :initarg :output)
   (output-type :initform "png" :accessor output-type :initarg :type)))

(defmethod perform ((o load-op) (component dot)) nil)

(defmethod output-files ((operation compile-op) (component dot))
  (values
   (list
    (out component (output-type component)))))

(defmethod perform ((o compile-op) (component dot))
  (run "dot -T~A ~A -o ~A"
       (output-type component)
       (namestring (component-pathname component))
       (namestring (out component (output-type component)))))

(import 'dot :asdf)
