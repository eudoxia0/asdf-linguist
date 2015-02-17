(in-package :asdf-linguist)

;;; CoffeeScript

(define-shell-component coffee
  :input-type "coffee"
  :output-type "js"
  :command-format "coffee -c ~A #~A")

;;; Roy

(define-shell-component roy
  :input-type "roy"
  :output-type "js"
  :command-format "roy -r ~A #~A")

;;; Parenscript

(define-component parenscript
  :input-type "lisp"
  :output-type "js"
  :compile-function (lambda (input-pathname output-pathname)
                      (with-open-file (stream output-pathname
                                              :direction :output
                                              :if-exists :supersede
                                              :if-does-not-exist :create)
                        (write-string (parenscript:ps-compile-file input-pathname)
                                      stream))))
