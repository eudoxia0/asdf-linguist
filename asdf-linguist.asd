(defsystem asdf-linguist
  :version "0.1"
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:asdf
               :inferior-shell
               :parenscript)
  :components ((:module "src"
                :serial t
                :components
                ((:file "base")
                 (:module "lang"
                  :components
                  ((:file "c")))
                 (:module "www"
                  :components
                  ((:file "css")
                   (:file "js")
                   (:file "tools")))
                 (:module "build-systems"
                  :components
                  ((:file "make")))
                 (:file "graphics")
                 (:module "text"
                  :components
                  ((:file "flex")
                   (:file "pandoc"))))))
  :description "Extensions for ASDF."
  :long-description #.(uiop:read-file-string
                       (uiop:subpathname *load-truename* "README.md"))
  :in-order-to ((test-op (load-op asdf-linguist-test))))
