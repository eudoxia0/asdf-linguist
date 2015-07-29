(in-package :asdf-linguist)

(define-shell-component flex
  :input-type "l"
  :output-type "c"
  :shell-command ("flex" "-o"))
