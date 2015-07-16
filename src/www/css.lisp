(in-package :asdf-linguist)

;;; Less

(define-shell-component less
  :input-type "less"
  :output-type "css"
  :command-format "lessc ~A ~A")

;;; Sass

(define-shell-component scss
  :input-type "scss"
  :output-type "css"
  :command-format "sass ~A ~A")

(define-shell-component sass
  :input-type "sass"
  :output-type "css"
  :command-format "sass ~A ~A")

;;; Myth

(define-shell-component myth
  :input-type "myth"
  :output-type "css"
  :command-format "myth ~A ~A")
