(in-package :cl-user)
(defpackage asdf-linguist-asd
  (:use :cl :asdf))
(in-package :asdf-linguist-asd)

(defsystem asdf-linguist
  :version "0.1"
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:asdf)
  :serial t
  :components ((:file "package")
               (:module "www"
                :components
                ((:module "css"
                  :components
                  ((:file "less")
                   (:file "myth"))))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op asdf-linguist-test))))
