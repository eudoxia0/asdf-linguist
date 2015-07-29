(in-package :asdf-linguist)

(defclass c->bin (source-file)
  ((type :initform "c")
   (output :reader output :initarg :output)
   (link :reader link :initarg :link)))

(defmethod perform ((o load-op) (component c->bin)) t)

(defmethod output-files ((operation compile-op) (component c->bin))
  (list (output-pathname component)))

(defmethod perform ((o compile-op) (component c->bin))
  (inferior-shell:run `("cc"
                        ,(namestring (component-pathname component))
                        "-o"
                        (namestring (output-pathname component))
                        ;;,@(loop for l in (link component) collect (list "-l" l))
                        (link component))))

(import 'c->bin :asdf)
