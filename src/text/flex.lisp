(in-package :asdf-linguist)

(defclass flex (source-file)
  ((type :initform "l")
   (output :reader output :initarg :output)))

(defmethod perform ((o load-op) (component flex)) t)

(defmethod output-files ((operation compile-op) (component flex))
  (values
   (list
    (output-pathname component "c"))))

(defmethod perform ((o compile-op) (component flex))
  (run-command "flex -o ~A ~A"
               (namestring (output-pathname component "c"))
               (namestring (component-pathname component))))

(import 'flex :asdf)

