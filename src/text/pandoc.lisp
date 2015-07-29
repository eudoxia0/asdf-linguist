(in-package :asdf-linguist)

(defclass pandoc (source-file)
  ((type :initarg :type :reader input-type)
   (input-format :initarg :input-type :reader input-format)
   (output :initarg :output :reader output)
   (output-type :initarg :output-type :reader output-type :initform nil)
   (output-extension :initarg :output-extension :reader output-extension)
   (options :initarg :options :reader options :initform "")))

(defmethod perform ((o load-op) (component pandoc)) t)

(defmethod output-files ((operation compile-op) (component pandoc))
  (list (output-pathname component (output-extension component))))

(defmethod perform ((o compile-op) (component pandoc))
  (inferior-shell:run
   `("pandoc" ,@(if (output-type component)
                    `("-t" ,(output-type component)))
               "-f"
               ,(input-format component)
               "-o"
               ,(namestring (output-pathname component (output-extension component)))
               ,(namestring (component-pathname component))
               ,(options component))
   :show t))

(import 'pandoc :asdf)
