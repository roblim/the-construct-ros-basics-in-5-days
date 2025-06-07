;; Auto-generated. Do not edit!


(when (boundp 'bb8_move_class_custom::BB8MoveServiceMessage)
  (if (not (find-package "BB8_MOVE_CLASS_CUSTOM"))
    (make-package "BB8_MOVE_CLASS_CUSTOM"))
  (shadow 'BB8MoveServiceMessage (find-package "BB8_MOVE_CLASS_CUSTOM")))
(unless (find-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGE")
  (make-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGE"))
(unless (find-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGEREQUEST")
  (make-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGEREQUEST"))
(unless (find-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGERESPONSE")
  (make-package "BB8_MOVE_CLASS_CUSTOM::BB8MOVESERVICEMESSAGERESPONSE"))

(in-package "ROS")





(defclass bb8_move_class_custom::BB8MoveServiceMessageRequest
  :super ros::object
  :slots (_duration ))

(defmethod bb8_move_class_custom::BB8MoveServiceMessageRequest
  (:init
   (&key
    ((:duration __duration) 0)
    )
   (send-super :init)
   (setq _duration (round __duration))
   self)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; int32 _duration
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _duration
       (write-long _duration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _duration
     (setq _duration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bb8_move_class_custom::BB8MoveServiceMessageResponse
  :super ros::object
  :slots (_success ))

(defmethod bb8_move_class_custom::BB8MoveServiceMessageResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass bb8_move_class_custom::BB8MoveServiceMessage
  :super ros::object
  :slots ())

(setf (get bb8_move_class_custom::BB8MoveServiceMessage :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_move_class_custom::BB8MoveServiceMessage :datatype-) "bb8_move_class_custom/BB8MoveServiceMessage")
(setf (get bb8_move_class_custom::BB8MoveServiceMessage :request) bb8_move_class_custom::BB8MoveServiceMessageRequest)
(setf (get bb8_move_class_custom::BB8MoveServiceMessage :response) bb8_move_class_custom::BB8MoveServiceMessageResponse)

(defmethod bb8_move_class_custom::BB8MoveServiceMessageRequest
  (:response () (instance bb8_move_class_custom::BB8MoveServiceMessageResponse :init)))

(setf (get bb8_move_class_custom::BB8MoveServiceMessageRequest :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_move_class_custom::BB8MoveServiceMessageRequest :datatype-) "bb8_move_class_custom/BB8MoveServiceMessageRequest")
(setf (get bb8_move_class_custom::BB8MoveServiceMessageRequest :definition-)
      "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles
---
bool success      # Did it achieve it?
")

(setf (get bb8_move_class_custom::BB8MoveServiceMessageResponse :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get bb8_move_class_custom::BB8MoveServiceMessageResponse :datatype-) "bb8_move_class_custom/BB8MoveServiceMessageResponse")
(setf (get bb8_move_class_custom::BB8MoveServiceMessageResponse :definition-)
      "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles
---
bool success      # Did it achieve it?
")



(provide :bb8_move_class_custom/BB8MoveServiceMessage "b92c952a9248b3029cefe45f52f6ffde")


