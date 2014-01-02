(in-package :asdf-linguist)

(defclass myth (source-file)
  ((type :initform "myth")))

(defmethod perform ((o load-op) (component myth)) t)

(defmethod output-files ((operation compile-op) (component myth))
  (values
    (list
      (make-pathname :defaults (component-pathname component)
                     :type "css"))))

(defmethod perform ((o compile-op) (component myth))
  (run "myth ~A ~A"
       (namestring (component-pathname component))
       (namestring (out component "css"))))

(import 'myth :asdf)
