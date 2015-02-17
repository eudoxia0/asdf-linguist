(asdf:defsystem asdf-linguist
  :version "0.1"
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :depends-on (:asdf
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
                 (:file "text"))))
  :description "Extensions for ASDF."
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
