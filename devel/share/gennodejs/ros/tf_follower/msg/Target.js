// Auto-generated. Do not edit!

// (in-package tf_follower.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Target {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.distance_now = null;
      this.angle_now = null;
      this.distance_last = null;
      this.angle_last = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('distance_now')) {
        this.distance_now = initObj.distance_now
      }
      else {
        this.distance_now = 0.0;
      }
      if (initObj.hasOwnProperty('angle_now')) {
        this.angle_now = initObj.angle_now
      }
      else {
        this.angle_now = 0.0;
      }
      if (initObj.hasOwnProperty('distance_last')) {
        this.distance_last = initObj.distance_last
      }
      else {
        this.distance_last = 0.0;
      }
      if (initObj.hasOwnProperty('angle_last')) {
        this.angle_last = initObj.angle_last
      }
      else {
        this.angle_last = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Target
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [distance_now]
    bufferOffset = _serializer.float64(obj.distance_now, buffer, bufferOffset);
    // Serialize message field [angle_now]
    bufferOffset = _serializer.float64(obj.angle_now, buffer, bufferOffset);
    // Serialize message field [distance_last]
    bufferOffset = _serializer.float64(obj.distance_last, buffer, bufferOffset);
    // Serialize message field [angle_last]
    bufferOffset = _serializer.float64(obj.angle_last, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Target
    let len;
    let data = new Target(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [distance_now]
    data.distance_now = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_now]
    data.angle_now = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_last]
    data.distance_last = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_last]
    data.angle_last = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.name.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tf_follower/Target';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0ff1ba6acf5def878d4ff2875af84dc3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Target(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.distance_now !== undefined) {
      resolved.distance_now = msg.distance_now;
    }
    else {
      resolved.distance_now = 0.0
    }

    if (msg.angle_now !== undefined) {
      resolved.angle_now = msg.angle_now;
    }
    else {
      resolved.angle_now = 0.0
    }

    if (msg.distance_last !== undefined) {
      resolved.distance_last = msg.distance_last;
    }
    else {
      resolved.distance_last = 0.0
    }

    if (msg.angle_last !== undefined) {
      resolved.angle_last = msg.angle_last;
    }
    else {
      resolved.angle_last = 0.0
    }

    return resolved;
    }
};

module.exports = Target;
