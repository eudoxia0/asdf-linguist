(in-package :asdf-linguist)

(define-shell-component ditaa
  :input-type "ditaa"
  :output-type "png"
  :shell-command "ditaa")

(define-component dot
  :input-type "dot"
  :output-type "png"
  :compile-function (lambda (input-pathname output-pathname)
                      (inferior-shell:run `("dot" "-Tpng" ,input-pathname "-o" ,output-pathname)
                                          :show t)))
