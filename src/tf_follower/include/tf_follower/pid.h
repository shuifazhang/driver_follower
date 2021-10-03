#ifndef PID_H
#define PID_H

#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"
#include "tf_follower/Target.h"
#include <queue>
#include <math.h>

//参数调试
#define D_KP 0.3 
#define D_KI 0.2
#define D_KD 0.0
#define A_KP 0.015
#define A_KI 0.0
#define A_KD 0.01


class NodePID
{
public:
    NodePID(ros::Publisher vel_pub,double dis,double ang);

    ~NodePID();

    // 发布小车的控制量
    void publishVel(double angleCommand,double speedCommand);

    //订阅自定义的Target控制跟踪
    void messageCallback(const tf_follower::Target::ConstPtr &msg);

    //雷达回调函数，控制避障
    void scanCallback(const sensor_msgs::LaserScan::ConstPtr & laser_msg);

    /*本函数通过PID控制器计算动作控制量
    需要输入的量如下：
    nowVal                    当前输出量
    lastVal                      上一步的输出量
    ref                              参考量
    t1                                对应于nowVal的时间
    t2                                对应于lastVal的时间
    Kp、Ki、Kd            PID参数
    sum                           偏差量之和
    */
    double calculatePID(double nowVal,double lastVal,double ref,double t1,double t2,double Kp, double Kd, double Ki, double *sum);

    ros::Publisher pubMessage;
    tf_follower::Target target_now;
    tf_follower::Target target_last;

    double dis_sum; //PID的sum of dis errors
    double ang_sum; //PID的sum of ang errors

    //@调试
    const double tolerance = 0.01;   //dis容忍度,由于uwb本身在安装距车头0.2m多的位置，为了和车头让出一个距离就之外另加了0.6m
    const double toleranceA = 10.0; //ang容忍度
    const double maxSpeed = 0.6;    //最大线速度,xtark最大线速度值为2
    const double maxASpeed = 0.9;   //最大角速度,xtark最大角速度值为1
    const double dis_tar = 0.0; //跟随目标直至dis为0
    const double ang_tar = 0.0; //转动身体直至与目标相对角度为0
    

    bool if_forward = true; // 是否前进信标
    bool if_achieve = false; // 到达目的地信标
    bool if_wuyu=true;        // 比较无语的信标


};






#endif