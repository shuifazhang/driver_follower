#include "tf_follower/pid.h"
double ranges[18]; //雷达数组的距离信息

NodePID::NodePID(ros::Publisher vel_pub,double dis, double ang)
{
    pubMessage=vel_pub;
    dis_sum=0.0;
    ang_sum=0.0;
}

NodePID::~NodePID()
{
}

double NodePID::calculatePID(double nowVal,double lastVal,double ref,double t1,double t2,double Kp, double Kd, double Ki, double *sum)
{
    double speed=0;
    double error=nowVal-ref;
    double previousError=lastVal-ref;
    double dt=t1-t2;
    double derivative=(error-previousError)/dt;
    *sum=*sum+error*dt;
    speed=Kp*error+Kd*derivative+Ki*(*sum);
    return speed;
}

void NodePID::messageCallback(const tf_follower::Target::ConstPtr& msg)
{
    double angleCommand=0.0;
    double speedCommand=0.0;
    double t1=0.0,t2=0.0;

    target_now.distance_now=msg->distance_now;
    target_now.angle_now=msg->angle_now;
    t1=msg->header.stamp.toSec();
   if(if_wuyu)
   {
    target_last.distance_last=msg->distance_now;
    target_last.angle_last=msg->angle_now;
    t2=msg->header.stamp.toSec();
    if_wuyu=false;
   }

    //判断是否到达目标点
    if(((msg->distance_now-dis_tar)<tolerance)&&((msg->angle_now-ang_tar)<toleranceA))
    {
        publishVel(0.0,0.0);
    }
    //else if((msg->angle_now-ang_tar)<toleranceA)
    //{
    //    publishVel(0.0,0.0);
    //}
        else
    {
            speedCommand=calculatePID(target_now.distance_now,target_last.distance_last,dis_tar,t1,t2,D_KP,D_KI,D_KD,&dis_sum);
            angleCommand=calculatePID(target_now.angle_now,target_last.angle_last,ang_tar,t1,t2,A_KP,A_KI,A_KD,&ang_sum);
            //double finalspeeda = angleCommand;
            double finalspeeda = (fabs(angleCommand) < this->maxASpeed ? angleCommand : copysign(this->maxASpeed, angleCommand));
            double finalspeed = (fabs(speedCommand) < this->maxSpeed ? speedCommand : copysign(this->maxSpeed, speedCommand));
            printf("---CONTROL---\nnum.3:\nspeedCommand : %f ,angleCommand : %f\n", finalspeed, finalspeeda);
            publishVel(finalspeeda, finalspeed);
    }
    // else
    // {
    //     if()//非常安全
    //     {
    //         speedCommand=calculatePID(target_now.distance_now,target_last.distance_last,dis_tar,t1,t2,D_KP,D_KI,D_KD,&dis_sum);
    //         angleCommand=calculatePID(target_now.angle_now,target_last.angle_last,ang_tar,t1,t2,A_KP,A_KI,A_KD,&ang_sum);
    //         double finalspeeda = (fabs(angleCommand) < this->maxASpeed ? angleCommand : copysign(this->maxASpeed, angleCommand));
    //         double finalspeed = (fabs(speedCommand) < this->maxSpeed ? speedCommand : copysign(this->maxSpeed, speedCommand));
    //         printf("---CONTROL---\nnum.3:\nspeedCommand : %f ,angleCommand : %f\n", finalspeed, finalspeeda);
    //         publishVel(finalspeeda, finalspeed);
    //     }
    //     else//需要转弯
    //     {
    //         if
    //     }
        
    target_last.distance_last=target_now.distance_now;
    target_last.angle_last=target_now.angle_now;
    t2=t1;
}

void scacCallback(const sensor_msgs::LaserScan::ConstPtr &laser_msg)
{
    for (int i = 90; i <271 ; i=i+10)
    {
        ranges[i]=laser_msg->ranges[i];
    }
    
}

void NodePID::publishVel(double angleCommand,double speedCommand)
{
    geometry_msgs::Twist msg;

    msg.linear.x=speedCommand;
    msg.angular.z=angleCommand;

    pubMessage.publish(msg);
}
