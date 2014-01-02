(in-package :asdf-linguist)

(defclass sass (source-file)
  ((type :initform "scss")))

(defmethod perform ((o load-op) (component sass)) t)

(defmethod output-files ((operation compile-op) (component sass))
  (values
    (list
      (make-pathname :defaults (component-pathname component)
                     :type "css"))))

(defmethod perform ((o compile-op) (component sass))
  (run "sass ~A ~A"
       (namestring (component-pathname component))
       (namestring (out component "css"))))

(import 'sass :asdf)
