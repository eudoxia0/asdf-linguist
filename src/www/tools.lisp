(in-package :asdf-linguist)

;;; YUI CSS compressor

(define-shell-component css-minify
  :input-type "css"
  :output-type "min.css"
  :command-format "yui-compressor ~A -o ~A")

;;; YUI JS compressor

(define-shell-component js-minify
  :input-type "js"
  :output-type "min.js"
  :command-format "yui-compressor ~A -o ~A")
