;; Auto-generated. Do not edit!


(when (boundp 'tf_follower::Target)
  (if (not (find-package "TF_FOLLOWER"))
    (make-package "TF_FOLLOWER"))
  (shadow 'Target (find-package "TF_FOLLOWER")))
(unless (find-package "TF_FOLLOWER::TARGET")
  (make-package "TF_FOLLOWER::TARGET"))

(in-package "ROS")
;;//! \htmlinclude Target.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass tf_follower::Target
  :super ros::object
  :slots (_header _name _distance_now _angle_now _distance_last _angle_last ))

(defmethod tf_follower::Target
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:distance_now __distance_now) 0.0)
    ((:angle_now __angle_now) 0.0)
    ((:distance_last __distance_last) 0.0)
    ((:angle_last __angle_last) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _distance_now (float __distance_now))
   (setq _angle_now (float __angle_now))
   (setq _distance_last (float __distance_last))
   (setq _angle_last (float __angle_last))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:distance_now
   (&optional __distance_now)
   (if __distance_now (setq _distance_now __distance_now)) _distance_now)
  (:angle_now
   (&optional __angle_now)
   (if __angle_now (setq _angle_now __angle_now)) _angle_now)
  (:distance_last
   (&optional __distance_last)
   (if __distance_last (setq _distance_last __distance_last)) _distance_last)
  (:angle_last
   (&optional __angle_last)
   (if __angle_last (setq _angle_last __angle_last)) _angle_last)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; float64 _distance_now
    8
    ;; float64 _angle_now
    8
    ;; float64 _distance_last
    8
    ;; float64 _angle_last
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float64 _distance_now
       (sys::poke _distance_now (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_now
       (sys::poke _angle_now (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance_last
       (sys::poke _distance_last (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle_last
       (sys::poke _angle_last (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _distance_now
     (setq _distance_now (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_now
     (setq _angle_now (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance_last
     (setq _distance_last (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle_last
     (setq _angle_last (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tf_follower::Target :md5sum-) "0ff1ba6acf5def878d4ff2875af84dc3")
(setf (get tf_follower::Target :datatype-) "tf_follower/Target")
(setf (get tf_follower::Target :definition-)
      "Header header
string name
float64 distance_now
float64 angle_now
float64 distance_last
float64 angle_last

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :tf_follower/Target "0ff1ba6acf5def878d4ff2875af84dc3")


