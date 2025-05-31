
(cl:in-package :asdf)

(defsystem "move_bb8_in_circle_custom-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MoveBB8Custom" :depends-on ("_package_MoveBB8Custom"))
    (:file "_package_MoveBB8Custom" :depends-on ("_package"))
  ))