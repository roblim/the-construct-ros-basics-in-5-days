;; Auto-generated. Do not edit!


(when (boundp 'custom_age_msg_pkg::Age)
  (if (not (find-package "CUSTOM_AGE_MSG_PKG"))
    (make-package "CUSTOM_AGE_MSG_PKG"))
  (shadow 'Age (find-package "CUSTOM_AGE_MSG_PKG")))
(unless (find-package "CUSTOM_AGE_MSG_PKG::AGE")
  (make-package "CUSTOM_AGE_MSG_PKG::AGE"))

(in-package "ROS")
;;//! \htmlinclude Age.msg.html


(defclass custom_age_msg_pkg::Age
  :super ros::object
  :slots (_years _months _days ))

(defmethod custom_age_msg_pkg::Age
  (:init
   (&key
    ((:years __years) 0.0)
    ((:months __months) 0.0)
    ((:days __days) 0.0)
    )
   (send-super :init)
   (setq _years (float __years))
   (setq _months (float __months))
   (setq _days (float __days))
   self)
  (:years
   (&optional __years)
   (if __years (setq _years __years)) _years)
  (:months
   (&optional __months)
   (if __months (setq _months __months)) _months)
  (:days
   (&optional __days)
   (if __days (setq _days __days)) _days)
  (:serialization-length
   ()
   (+
    ;; float32 _years
    4
    ;; float32 _months
    4
    ;; float32 _days
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _years
       (sys::poke _years (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _months
       (sys::poke _months (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _days
       (sys::poke _days (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _years
     (setq _years (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _months
     (setq _months (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _days
     (setq _days (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get custom_age_msg_pkg::Age :md5sum-) "e8088e290d061dabc94e1feafd4db363")
(setf (get custom_age_msg_pkg::Age :datatype-) "custom_age_msg_pkg/Age")
(setf (get custom_age_msg_pkg::Age :definition-)
      "float32 years
float32 months
float32 days

")



(provide :custom_age_msg_pkg/Age "e8088e290d061dabc94e1feafd4db363")


