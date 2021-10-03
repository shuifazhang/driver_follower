#include "tf_follower/pid.h"
#define PI 3.1415926


int main(int argc, char  *argv[])
{
    ros::init(argc,argv,"nodePID");
    ros::NodeHandle n;

    double distance = 0.0;
    double angle = 0.0;

    ros::Publisher pubMessage = n.advertise<geometry_msgs::Twist>("/follower1/cmd_vel", 500);

    NodePID* nodePID=new NodePID(pubMessage, distance, angle);

    //订阅自定义的Target消息以PID的方式控制跟踪
    ros::Subscriber subdisang=n.subscribe("/follower1/point2me",500,&NodePID::messageCallback,nodePID);

    //订阅雷达消息/follower1/scan，控制避障
    //ros::Subscriber subobs=n.subscribe("/follower1/scan",500,&NodePID::scanCallback,nodePID);

    ros::spin();

    return 0;
}
