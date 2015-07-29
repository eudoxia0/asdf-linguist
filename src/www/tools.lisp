(in-package :asdf-linguist)

;;; YUI CSS compressor

(define-component css-minify
  :input-type "css"
  :output-type "min.css"
  :compile-function (lambda (input-pathname output-pathname)
                      (inferior-shell:run
                       `("yui-compressor" ,input-pathname "-o" ,output-pathname)
                       :show t)))

;;; YUI JS compressor

(define-component js-minify
  :input-type "js"
  :output-type "min.js"
  :compile-function (lambda (input-pathname output-pathname)
                      (inferior-shell:run
                       `("yui-compressor" ,input-pathname "-o" ,output-pathname)
                       :show t)))
