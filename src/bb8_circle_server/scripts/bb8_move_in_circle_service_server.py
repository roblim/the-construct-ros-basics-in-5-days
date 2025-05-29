#! /usr/bin/env python

import rospy
from std_srvs.srv import Empty, EmptyResponse # you import the service message python classes generated from Empty.srv.
from geometry_msgs.msg import Twist


def my_callback(request):
    print("My_callback has been called")
    cmd_vel_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10)

    # Wait until publisher is registered with master
    while cmd_vel_publisher.get_num_connections() == 0 and not rospy.is_shutdown():
        rospy.sleep(0.1)

    cmd_vel_msg = Twist()
    cmd_vel_msg.linear.x = 1
    cmd_vel_msg.angular.z = 0.5

    # rate = rospy.Rate(10)  # 10 Hz
    # while not rospy.is_shutdown():
    #     cmd_vel_publisher.publish(cmd_vel_msg)
    #     rate.sleep()

    cmd_vel_publisher.publish(cmd_vel_msg)

    return EmptyResponse() # the service Response class, in this case EmptyResponse
    #return MyServiceResponse(len(request.words.split())) 


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_node')
    my_service = rospy.Service('/move_bb8_in_circle', Empty, my_callback)
    rospy.spin()