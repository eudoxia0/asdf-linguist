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
   (output-pathname component (output-extension component))))

(defmethod perform ((o compile-op) (component pandoc))
  (run-command "pandoc ~A -f ~A -o ~A ~A ~A"
               (if (output-type component)
                   (concatenate 'string "-t " (output-type component))
                   "")
               (input-format component)
               (namestring (output-pathname component
                                            (output-extension component)))
               (namestring (component-pathname component))
               (options component)))

(import 'pandoc :asdf)
