; Auto-generated. Do not edit!


(cl:in-package bb8_move_class_custom-srv)


;//! \htmlinclude BB8MoveServiceMessage-request.msg.html

(cl:defclass <BB8MoveServiceMessage-request> (roslisp-msg-protocol:ros-message)
  ((duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass BB8MoveServiceMessage-request (<BB8MoveServiceMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BB8MoveServiceMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BB8MoveServiceMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bb8_move_class_custom-srv:<BB8MoveServiceMessage-request> is deprecated: use bb8_move_class_custom-srv:BB8MoveServiceMessage-request instead.")))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <BB8MoveServiceMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bb8_move_class_custom-srv:duration-val is deprecated.  Use bb8_move_class_custom-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BB8MoveServiceMessage-request>) ostream)
  "Serializes a message object of type '<BB8MoveServiceMessage-request>"
  (cl:let* ((signed (cl:slot-value msg 'duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BB8MoveServiceMessage-request>) istream)
  "Deserializes a message object of type '<BB8MoveServiceMessage-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'duration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BB8MoveServiceMessage-request>)))
  "Returns string type for a service object of type '<BB8MoveServiceMessage-request>"
  "bb8_move_class_custom/BB8MoveServiceMessageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BB8MoveServiceMessage-request)))
  "Returns string type for a service object of type 'BB8MoveServiceMessage-request"
  "bb8_move_class_custom/BB8MoveServiceMessageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BB8MoveServiceMessage-request>)))
  "Returns md5sum for a message object of type '<BB8MoveServiceMessage-request>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BB8MoveServiceMessage-request)))
  "Returns md5sum for a message object of type 'BB8MoveServiceMessage-request"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BB8MoveServiceMessage-request>)))
  "Returns full string definition for message of type '<BB8MoveServiceMessage-request>"
  (cl:format cl:nil "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BB8MoveServiceMessage-request)))
  "Returns full string definition for message of type 'BB8MoveServiceMessage-request"
  (cl:format cl:nil "int32 duration    # The time (in seconds) during which BB-8 will keep moving in circles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BB8MoveServiceMessage-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BB8MoveServiceMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BB8MoveServiceMessage-request
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude BB8MoveServiceMessage-response.msg.html

(cl:defclass <BB8MoveServiceMessage-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BB8MoveServiceMessage-response (<BB8MoveServiceMessage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BB8MoveServiceMessage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BB8MoveServiceMessage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bb8_move_class_custom-srv:<BB8MoveServiceMessage-response> is deprecated: use bb8_move_class_custom-srv:BB8MoveServiceMessage-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <BB8MoveServiceMessage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bb8_move_class_custom-srv:success-val is deprecated.  Use bb8_move_class_custom-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BB8MoveServiceMessage-response>) ostream)
  "Serializes a message object of type '<BB8MoveServiceMessage-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BB8MoveServiceMessage-response>) istream)
  "Deserializes a message object of type '<BB8MoveServiceMessage-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BB8MoveServiceMessage-response>)))
  "Returns string type for a service object of type '<BB8MoveServiceMessage-response>"
  "bb8_move_class_custom/BB8MoveServiceMessageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BB8MoveServiceMessage-response)))
  "Returns string type for a service object of type 'BB8MoveServiceMessage-response"
  "bb8_move_class_custom/BB8MoveServiceMessageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BB8MoveServiceMessage-response>)))
  "Returns md5sum for a message object of type '<BB8MoveServiceMessage-response>"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BB8MoveServiceMessage-response)))
  "Returns md5sum for a message object of type 'BB8MoveServiceMessage-response"
  "b92c952a9248b3029cefe45f52f6ffde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BB8MoveServiceMessage-response>)))
  "Returns full string definition for message of type '<BB8MoveServiceMessage-response>"
  (cl:format cl:nil "bool success      # Did it achieve it?~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BB8MoveServiceMessage-response)))
  "Returns full string definition for message of type 'BB8MoveServiceMessage-response"
  (cl:format cl:nil "bool success      # Did it achieve it?~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BB8MoveServiceMessage-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BB8MoveServiceMessage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BB8MoveServiceMessage-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BB8MoveServiceMessage)))
  'BB8MoveServiceMessage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BB8MoveServiceMessage)))
  'BB8MoveServiceMessage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BB8MoveServiceMessage)))
  "Returns string type for a service object of type '<BB8MoveServiceMessage>"
  "bb8_move_class_custom/BB8MoveServiceMessage")