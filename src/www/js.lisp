(in-package :asdf-linguist)

;;; CoffeeScript

(define-shell-component coffee
  :input-type "coffee"
  :output-type "js"
  :shell-command ("coffee" "-c"))

;;; Roy

(define-shell-component roy
  :input-type "roy"
  :output-type "js"
  :shell-command ("roy" "-r"))

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
