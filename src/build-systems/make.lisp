(in-package :asdf-linguist)

(define-component make)

(defmethod perform ((o compile-op) (component make))
  (inferior-shell:run `("make" "-f" ,(component-pathname component))
                      :show t))
