
(cl:in-package :asdf)

(defsystem "bb8_move_class_custom-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BB8MoveServiceMessage" :depends-on ("_package_BB8MoveServiceMessage"))
    (:file "_package_BB8MoveServiceMessage" :depends-on ("_package"))
  ))