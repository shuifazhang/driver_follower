;; Auto-generated. Do not edit!


(when (boundp 'tf_follower::target)
  (if (not (find-package "TF_FOLLOWER"))
    (make-package "TF_FOLLOWER"))
  (shadow 'target (find-package "TF_FOLLOWER")))
(unless (find-package "TF_FOLLOWER::TARGET")
  (make-package "TF_FOLLOWER::TARGET"))

(in-package "ROS")
;;//! \htmlinclude target.msg.html


(defclass tf_follower::target
  :super ros::object
  :slots (_name _distance_now _angle_now _distance_last _angle_last ))

(defmethod tf_follower::target
  (:init
   (&key
    ((:name __name) "")
    ((:distance_now __distance_now) 0)
    ((:angle_now __angle_now) 0)
    ((:distance_last __distance_last) 0)
    ((:angle_last __angle_last) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _distance_now (round __distance_now))
   (setq _angle_now (round __angle_now))
   (setq _distance_last (round __distance_last))
   (setq _angle_last (round __angle_last))
   self)
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
    ;; string _name
    4 (length _name)
    ;; uint16 _distance_now
    2
    ;; uint16 _angle_now
    2
    ;; uint16 _distance_last
    2
    ;; uint16 _angle_last
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint16 _distance_now
       (write-word _distance_now s)
     ;; uint16 _angle_now
       (write-word _angle_now s)
     ;; uint16 _distance_last
       (write-word _distance_last s)
     ;; uint16 _angle_last
       (write-word _angle_last s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _distance_now
     (setq _distance_now (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _angle_now
     (setq _angle_now (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _distance_last
     (setq _distance_last (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _angle_last
     (setq _angle_last (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get tf_follower::target :md5sum-) "becf92d4226522de36a098100add3213")
(setf (get tf_follower::target :datatype-) "tf_follower/target")
(setf (get tf_follower::target :definition-)
      "string  name
uint16  distance_now
uint16  angle_now
uint16  distance_last
uint16  angle_last

")



(provide :tf_follower/target "becf92d4226522de36a098100add3213")


