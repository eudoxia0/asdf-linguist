(in-package :asdf-linguist)

;;; CoffeeScript

(define-simple-component coffee
  :input-type "coffee"
  :output-type "js"
  :command-format "coffee -c ~A #~A")

;;; Roy

(define-simple-component roy
  :input-type "roy"
  :output-type "js"
  :command-fprmat "roy -r ~A #~A")

;;; Parenscript
