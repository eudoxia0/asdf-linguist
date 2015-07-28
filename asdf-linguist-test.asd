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
                     (:sass "sass-input")
                     (:sass-strict "sass-strict-input")))))
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
                      :input-type "markdown"
                      :output-type "html5"
                      :output-extension "html"
                      :options "-S")))))))))
