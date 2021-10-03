/************************************************
@张晨阳
功能：在小车上启动，接受里程计消息，发布小车的位置及姿态信息
*************************************************/
#include "ros/ros.h"
#include "tf2_ros/transform_broadcaster.h"
#include "geometry_msgs/TransformStamped.h"
#include  <nav_msgs/Odometry.h>

std::string follower_name;
void posecallback(const nav_msgs::Odometry::ConstPtr & msg);

int main(int argc, char  *argv[])
{
    setlocale(LC_ALL,"");
    //1,初始化节点
    ros::init(argc,argv,"follower");

    //2,解析传入的命名空间
    if (argc!=2)
    {
        ROS_ERROR ("please give more param");
    }
    else
    {
        follower_name=argv[1];
        ROS_INFO("小车 %s 坐标发送启动",follower_name.c_str());
    }

    //3,创建函数句柄
    ros::NodeHandle followernode;

    //4,创建订阅对象
    ros::Subscriber sub=followernode.subscribe(follower_name+"/odom",10,&posecallback);

    ros::spin();
    return 0;
}

void posecallback(const nav_msgs::Odometry::ConstPtr & msg)
{
    //5,创建TF广播器
    static tf2_ros::TransformBroadcaster br;

    //6,把车辆姿态信息转化成数据类型TransFormStamped
    geometry_msgs::TransformStamped tfs;
    tfs.header.frame_id="odom";
    tfs.child_frame_id="base_footprint";
    tfs.header.stamp=ros::Time::now();
    tfs.child_frame_id=follower_name;
    tfs.transform.translation.x=msg->pose.pose.position.x;
    tfs.transform.translation.y=msg->pose.pose.position.y;
    tfs.transform.translation.z=msg->pose.pose.position.z;
    tfs.transform.rotation.x=msg->pose.pose.orientation.x;
    tfs.transform.rotation.y=msg->pose.pose.orientation.y;
    tfs.transform.rotation.z=msg->pose.pose.orientation.z;
    tfs.transform.rotation.w=msg->pose.pose.orientation.w;

    //7,广播器发布数据
    br.sendTransform(tfs);
}
