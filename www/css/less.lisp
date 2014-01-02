(in-package :asdf-linguist)

(defclass less (source-file)
  ((type :initform "less")))

(defmethod perform ((o load-op) (component less)) t)

(defmethod output-files ((operation compile-op) (component less))
  (values
    (list
      (make-pathname :defaults (component-pathname component)
                     :type "css"))))

(defmethod perform ((o compile-op) (component less))
  (run "lessc ~A ~A"
       (namestring (component-pathname component))
       (namestring (out component "css"))))

(import 'less :asdf)
