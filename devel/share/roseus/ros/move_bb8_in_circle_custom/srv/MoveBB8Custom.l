;; Auto-generated. Do not edit!


(when (boundp 'move_bb8_in_circle_custom::MoveBB8Custom)
  (if (not (find-package "MOVE_BB8_IN_CIRCLE_CUSTOM"))
    (make-package "MOVE_BB8_IN_CIRCLE_CUSTOM"))
  (shadow 'MoveBB8Custom (find-package "MOVE_BB8_IN_CIRCLE_CUSTOM")))
(unless (find-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOM")
  (make-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOM"))
(unless (find-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOMREQUEST")
  (make-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOMREQUEST"))
(unless (find-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOMRESPONSE")
  (make-package "MOVE_BB8_IN_CIRCLE_CUSTOM::MOVEBB8CUSTOMRESPONSE"))

(in-package "ROS")





(defclass move_bb8_in_circle_custom::MoveBB8CustomRequest
  :super ros::object
  :slots (_duration ))

(defmethod move_bb8_in_circle_custom::MoveBB8CustomRequest
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

(defclass move_bb8_in_circle_custom::MoveBB8CustomResponse
  :super ros::object
  :slots (_success ))

(defmethod move_bb8_in_circle_custom::MoveBB8CustomResponse
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

(defclass move_bb8_in_circle_custom::MoveBB8Custom
  :super ros::object
  :slots ())

(setf (get move_bb8_in_circle_custom::MoveBB8Custom :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get move_bb8_in_circle_custom::MoveBB8Custom :datatype-) "move_bb8_in_circle_custom/MoveBB8Custom")
(setf (get move_bb8_in_circle_custom::MoveBB8Custom :request) move_bb8_in_circle_custom::MoveBB8CustomRequest)
(setf (get move_bb8_in_circle_custom::MoveBB8Custom :response) move_bb8_in_circle_custom::MoveBB8CustomResponse)

(defmethod move_bb8_in_circle_custom::MoveBB8CustomRequest
  (:response () (instance move_bb8_in_circle_custom::MoveBB8CustomResponse :init)))

(setf (get move_bb8_in_circle_custom::MoveBB8CustomRequest :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get move_bb8_in_circle_custom::MoveBB8CustomRequest :datatype-) "move_bb8_in_circle_custom/MoveBB8CustomRequest")
(setf (get move_bb8_in_circle_custom::MoveBB8CustomRequest :definition-)
      "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles
---
bool success      # Did it achieve it?
")

(setf (get move_bb8_in_circle_custom::MoveBB8CustomResponse :md5sum-) "b92c952a9248b3029cefe45f52f6ffde")
(setf (get move_bb8_in_circle_custom::MoveBB8CustomResponse :datatype-) "move_bb8_in_circle_custom/MoveBB8CustomResponse")
(setf (get move_bb8_in_circle_custom::MoveBB8CustomResponse :definition-)
      "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles
---
bool success      # Did it achieve it?
")



(provide :move_bb8_in_circle_custom/MoveBB8Custom "b92c952a9248b3029cefe45f52f6ffde")


