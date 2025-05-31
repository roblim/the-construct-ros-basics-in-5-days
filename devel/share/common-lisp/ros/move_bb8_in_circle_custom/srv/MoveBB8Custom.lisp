; Auto-generated. Do not edit!


(cl:in-package move_bb8_in_circle_custom-srv)


;//! \htmlinclude MoveBB8Custom-request.msg.html

(cl:defclass <MoveBB8Custom-request> (roslisp-msg-protocol:ros-message)
  ((duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveBB8Custom-request (<MoveBB8Custom-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBB8Custom-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBB8Custom-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_bb8_in_circle_custom-srv:<MoveBB8Custom-request> is deprecated: use move_bb8_in_circle_custom-srv:MoveBB8Custom-request instead.")))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <MoveBB8Custom-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_bb8_in_circle_custom-srv:duration-val is deprecated.  Use move_bb8_in_circle_custom-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBB8Custom-request>) ostream)
  "Serializes a message object of type '<MoveBB8Custom-request>"
  (cl:let* ((signed (cl:slot-value msg 'duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBB8Custom-request>) istream)
  "Deserializes a message object of type '<MoveBB8Custom-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'duration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBB8Custom-request>)))
  "Returns string type for a service object of type '<MoveBB8Custom-request>"
  "move_bb8_in_circle_custom/MoveBB8CustomRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBB8Custom-request)))
  "Returns string type for a service object of type 'MoveBB8Custom-request"
  "move_bb8_in_circle_custom/MoveBB8CustomRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBB8Custom-request>)))
  "Returns md5sum for a message object of type '<MoveBB8Custom-request>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBB8Custom-request)))
  "Returns md5sum for a message object of type 'MoveBB8Custom-request"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBB8Custom-request>)))
  "Returns full string definition for message of type '<MoveBB8Custom-request>"
  (cl:format cl:nil "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBB8Custom-request)))
  "Returns full string definition for message of type 'MoveBB8Custom-request"
  (cl:format cl:nil "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBB8Custom-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBB8Custom-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBB8Custom-request
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude MoveBB8Custom-response.msg.html

(cl:defclass <MoveBB8Custom-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveBB8Custom-response (<MoveBB8Custom-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBB8Custom-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBB8Custom-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_bb8_in_circle_custom-srv:<MoveBB8Custom-response> is deprecated: use move_bb8_in_circle_custom-srv:MoveBB8Custom-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveBB8Custom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_bb8_in_circle_custom-srv:success-val is deprecated.  Use move_bb8_in_circle_custom-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBB8Custom-response>) ostream)
  "Serializes a message object of type '<MoveBB8Custom-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBB8Custom-response>) istream)
  "Deserializes a message object of type '<MoveBB8Custom-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBB8Custom-response>)))
  "Returns string type for a service object of type '<MoveBB8Custom-response>"
  "move_bb8_in_circle_custom/MoveBB8CustomResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBB8Custom-response)))
  "Returns string type for a service object of type 'MoveBB8Custom-response"
  "move_bb8_in_circle_custom/MoveBB8CustomResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBB8Custom-response>)))
  "Returns md5sum for a message object of type '<MoveBB8Custom-response>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBB8Custom-response)))
  "Returns md5sum for a message object of type 'MoveBB8Custom-response"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBB8Custom-response>)))
  "Returns full string definition for message of type '<MoveBB8Custom-response>"
  (cl:format cl:nil "bool success      # Did it achieve it?~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBB8Custom-response)))
  "Returns full string definition for message of type 'MoveBB8Custom-response"
  (cl:format cl:nil "bool success      # Did it achieve it?~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBB8Custom-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBB8Custom-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBB8Custom-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveBB8Custom)))
  'MoveBB8Custom-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveBB8Custom)))
  'MoveBB8Custom-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBB8Custom)))
  "Returns string type for a service object of type '<MoveBB8Custom>"
  "move_bb8_in_circle_custom/MoveBB8Custom")