(in-package :asdf-linguist)

;;; Less

(define-shell-component less
  :input-type "less"
  :output-type "css"
  :shell-command "lessc")

;;; Sass

(define-shell-component sass
  :input-type "scss"
  :output-type "css"
  :shell-command "sass")

(define-shell-component sass-strict
  :input-type "sass"
  :output-type "css"
  :shell-command "sass")

;;; Myth

(define-shell-component myth
  :input-type "myth"
  :output-type "css"
  :shell-command "myth")
