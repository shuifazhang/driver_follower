/************************************************
@张晨阳
功能包 ： tf_follower
功能 ： 主机与x_tark小车实现多机通讯，通过TF树，主机上发送一个坐标，控制小车向坐标位置行驶
进度 ： 2021.9.22启动
思路 ： 1，第一步：
                       首先需要两个发布节点，一个订阅小车的里程计消息并转化成坐标发布出去
                       另一个是把预先人为给定的一个坐标点发布出去；
                2，第二步：
                        小车订阅两个坐标，并进行坐标转化，计算相对位置，然后把信息传入
                        PID控制器，控制小车前进；
                      （此时已经能得知通过TF树实现全套方案的可能性）
                3，第三步：
                        实现避障，利用小车上的红外测距头或者雷达；
                4，第四步：
                        加入第二辆车，订阅第一辆车的位置并控制跟踪，利用传感器避障。
功能：由主机启动该节点，给定一个目标点及到达目标点时要求的车姿
*************************************************/


#include "ros/ros.h"
#include "tf2_ros/static_transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include "tf2/LinearMath/Quaternion.h"
#define PI 3.1415926

int  main(int argc, char  *argv[])
{
       setlocale(LC_ALL,"");
    //1,休眠5秒为人为操作做准备
       //sleep(5);

    //2,初始化节点
       ros::init(argc,argv,"master");

    //3,创建静态坐标转化广播器
        tf2_ros::StaticTransformBroadcaster br;

    // 5,创建一个目标点并赋值(相对于子级坐标系)
        geometry_msgs::TransformStamped point;
        point.header.frame_id="odom";
        point.child_frame_id="point";
        point.header.stamp=ros::Time::now();
        point.transform.translation.x=2;
        point.transform.translation.y=0.5;
        point.transform.translation.z=0;
        tf2::Quaternion qtn;
        qtn.setRPY(0,0,0);
        point.transform.rotation.x=qtn.getX();
        point.transform.rotation.y=qtn.getY();
        point.transform.rotation.z=qtn.getZ();
        point.transform.rotation.w=qtn.getW();

    //6,广播器发布坐标消息
    br.sendTransform(point);
    ROS_WARN("已发送目标点%f,%f",point.transform.translation.x,point.transform.translation.y);
    ros::spin();

    return 0;
}
