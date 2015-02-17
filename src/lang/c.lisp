(in-package :asdf-linguist)

(defclass c->bin (source-file)
  ((type :initform "c")
   (output :reader output :initarg :output)
   (link :reader link :initarg :link)))

(defmethod perform ((o load-op) (component c->bin)) t)

(defmethod output-files ((operation compile-op) (component c->bin))
  (values
   (list
    (output-pathname component))))

(defmethod perform ((o compile-op) (component c->bin))
  (run-command "cc ~A -o ~A ~{-l~A~}"
               (namestring (component-pathname component))
               (namestring (output-pathname component))
               (link component)))

(import 'c->bin :asdf)
