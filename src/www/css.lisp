(in-package :asdf-linguist)

;;; Less

(define-simple-component less
  :input-type "less"
  :output-type "css"
  :command-format "lessc ~A ~A")

;;; Sass

(define-simple-component sass
  :input-type "scss"
  :output-type "css"
  :command-format "sass ~A ~A")

;;; Myth

(define-simple-component myth
  :input-type "myth"
  :output-type "css"
  :command-format "myth ~A ~A")
