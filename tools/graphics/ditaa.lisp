(in-package :asdf-linguist)

(defclass ditaa (source-file)
  ((type :initform "ditaa")))

(defmethod perform ((o load-op) (component ditaa)) t)

(defmethod output-files ((operation compile-op) (component ditaa))
  (values
    (list
      (make-pathname :defaults (component-pathname component)
                     :type "png"))))

(defmethod perform ((o compile-op) (component ditaa))
  (run "ditaa ~A ~A"
       (namestring (component-pathname component))
       (namestring (out component "png"))))

(import 'ditaa :asdf)
