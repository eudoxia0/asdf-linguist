(in-package :cl-user)
(defpackage asdf-linguist-test-asd
  (:use :cl :asdf))
(in-package :asdf-linguist-test-asd)

(defsystem asdf-linguist-test
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :defsystem-depends-on (:asdf-linguist)
  :components ((:module "t"
                :components
                ((:module "www"
                  :components
                  ((:module "css"
                    :components
                    ((:less "less-input")
                     (:myth "myth-input")
                     (:sass "sass-input")))))
                 (:module "build-systems"
                  :components
                  ((:make "Makefile")))
                 (:module "tools"
                  :components
                  ((:module "graphics"
                    :components
                    ((:dot "dot-input")
                     (:ditaa "ditaa-input")))
                   (:module "text"
                    :components
                    ((:pandoc "test"
                      :type "md"
                      :output-type "html"
                      :options "-S")))))))))
