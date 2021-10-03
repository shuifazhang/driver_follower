/************************************************
@张晨阳
功能：在小车上启动，从TF树收听目标点位置及姿态信息，计算差值，并控制跟踪与避障

现在有两种思路：
1，直接在这里操作，发布速度
2，这个节点仅仅作为位置和角度发布节点
先试一试2吧
关于发布节点的数据类型，直接给他加上时间戳就行，一开始的思路太笨了
*************************************************/
#include "ros/ros.h"
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include "sensor_msgs/LaserScan.h"
#include "tf_follower/Target.h"

int main(int argc, char  *argv[])
{
    setlocale(LC_ALL,"");
    ros::init(argc,argv,"listener");
    ros::NodeHandle listenernode;

    //初始化状态量
    double distance_now=0.0;
    double angle_now=0.0;
    double distance_last=0.0;
    double angle_last=0.0;

    //创建速度发布者
    //ros::Publisher vel_pub=listenernode.advertise<geometry_msgs::Twist>("/follower1/cmd_vel",500);

    //创建目标发布者
    //发布的消息是包含了相隔固定时间间隔的两组距离和角度值
    ros::Publisher target=listenernode.advertise<tf_follower::Target>("/follower1/point2me",500);

    //创建TF收听者
    tf::TransformListener listener1;

    ros::Rate rate(1000.0);
    //listenernode.ok()返回false的四种情况
    // 1、按下Ctrl-C时。
    // 2、我们被一个同名同姓的节点从网络中踢出。
    // 3、ros::shutdown()被应用程序的另一部分调用。
    // 4、所有的ros::NodeHandles都被销毁了。
    while (listenernode.ok())
    {
        tf::StampedTransform tfsFM_now;
        tf::StampedTransform tfsFM_last;
         try
        {
            //ros::Time now = ros::Time::now();
            //ros::Time past = now - ros::Duration(0.2);
            listener1.waitForTransform("/follower1", "/point", ros::Time(0), ros::Duration(3.0));
            listener1.lookupTransform("/follower1","/point",ros::Time(0),tfsFM_now);
           // listener1.waitForTransform("/follower1", past,"/point", now,"/point", ros::Duration(3.0));
            //listener1.lookupTransform("/follower1", past,"/point", now,"/point", tfsFM_last);
        }
        catch(tf::TransformException &ex)
        {
            ROS_ERROR("%s",ex.what());
            ros::Duration(1.0).sleep();
            continue;
        }

        //蠢哭了，直接在自定义消息里加上时间戳就行了，整这一套干啥
        // try
        // {
        //     ros::Time now = ros::Time::now();
        //     ros::Time past = now - ros::Duration(0.1);
        //     listener1.waitForTransform("/follower1", past,"/point", now,"/point", ros::Duration(3.0));
        //     listener1.lookupTransform("/follower1", past,"/point", now,"/point", tfsFM_last);
        // }
        // catch(tf::TransformException &ex)
        // {
        //     ROS_ERROR("%s",ex.what());
        //     ros::Duration(1.0).sleep();
        //     continue;
        // }
    /*构建pid算法对象来完成：
    * 控制量的计算 ： calculatePID
    * 是否到达终点的判断 ： closeEnough
    * 控制量的发布 ： publishMessage
    * 数据的储存及小车状态的更新（回调函数） ： messageCallback
    */
        distance_now=sqrt((pow(tfsFM_now.getOrigin().x(), 2) + pow(tfsFM_now.getOrigin().y(), 2)));
        angle_now=atan2(tfsFM_now.getOrigin().y(),  tfsFM_now.getOrigin().x());
        //distance_last=sqrt((pow(tfsFM_last.getOrigin().x(), 2) + pow(tfsFM_last.getOrigin().y(), 2)));
        //angle_last=atan2(tfsFM_last.getOrigin().y(),  tfsFM_last.getOrigin().x());
        
        tf_follower::Target target_point;
        target_point.name="my_target";
        target_point.header.stamp=ros::Time::now();
        target_point.distance_now=distance_now;
        target_point.angle_now=angle_now;
        //target_point.distance_last=distance_last;
        //target_point.angle_now=angle_last;
        target.publish(target_point);
        ros::spinOnce();
        rate.sleep();
    }
    
    return 0;
}
