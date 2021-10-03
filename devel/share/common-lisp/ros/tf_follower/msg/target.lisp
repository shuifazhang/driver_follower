; Auto-generated. Do not edit!


(cl:in-package tf_follower-msg)


;//! \htmlinclude target.msg.html

(cl:defclass <target> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (distance_now
    :reader distance_now
    :initarg :distance_now
    :type cl:fixnum
    :initform 0)
   (angle_now
    :reader angle_now
    :initarg :angle_now
    :type cl:fixnum
    :initform 0)
   (distance_last
    :reader distance_last
    :initarg :distance_last
    :type cl:fixnum
    :initform 0)
   (angle_last
    :reader angle_last
    :initarg :angle_last
    :type cl:fixnum
    :initform 0))
)

(cl:defclass target (<target>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <target>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'target)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tf_follower-msg:<target> is deprecated: use tf_follower-msg:target instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tf_follower-msg:name-val is deprecated.  Use tf_follower-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'distance_now-val :lambda-list '(m))
(cl:defmethod distance_now-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tf_follower-msg:distance_now-val is deprecated.  Use tf_follower-msg:distance_now instead.")
  (distance_now m))

(cl:ensure-generic-function 'angle_now-val :lambda-list '(m))
(cl:defmethod angle_now-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tf_follower-msg:angle_now-val is deprecated.  Use tf_follower-msg:angle_now instead.")
  (angle_now m))

(cl:ensure-generic-function 'distance_last-val :lambda-list '(m))
(cl:defmethod distance_last-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tf_follower-msg:distance_last-val is deprecated.  Use tf_follower-msg:distance_last instead.")
  (distance_last m))

(cl:ensure-generic-function 'angle_last-val :lambda-list '(m))
(cl:defmethod angle_last-val ((m <target>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tf_follower-msg:angle_last-val is deprecated.  Use tf_follower-msg:angle_last instead.")
  (angle_last m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <target>) ostream)
  "Serializes a message object of type '<target>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_now)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_now)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_now)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_now)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_last)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_last)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_last)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_last)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <target>) istream)
  "Deserializes a message object of type '<target>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_now)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_now)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_now)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_now)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance_last)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance_last)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'angle_last)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'angle_last)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<target>)))
  "Returns string type for a message object of type '<target>"
  "tf_follower/target")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'target)))
  "Returns string type for a message object of type 'target"
  "tf_follower/target")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<target>)))
  "Returns md5sum for a message object of type '<target>"
  "becf92d4226522de36a098100add3213")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'target)))
  "Returns md5sum for a message object of type 'target"
  "becf92d4226522de36a098100add3213")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<target>)))
  "Returns full string definition for message of type '<target>"
  (cl:format cl:nil "string  name~%uint16  distance_now~%uint16  angle_now~%uint16  distance_last~%uint16  angle_last~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'target)))
  "Returns full string definition for message of type 'target"
  (cl:format cl:nil "string  name~%uint16  distance_now~%uint16  angle_now~%uint16  distance_last~%uint16  angle_last~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <target>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <target>))
  "Converts a ROS message object to a list"
  (cl:list 'target
    (cl:cons ':name (name msg))
    (cl:cons ':distance_now (distance_now msg))
    (cl:cons ':angle_now (angle_now msg))
    (cl:cons ':distance_last (distance_last msg))
    (cl:cons ':angle_last (angle_last msg))
))
