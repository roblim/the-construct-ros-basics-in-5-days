#! /usr/bin/env python

import rospy
from move_bb8_in_circle_custom.srv import MoveBB8Custom, MoveBB8CustomRequest, MoveBB8CustomResponse
from geometry_msgs.msg import Twist


def my_callback(request: MoveBB8CustomRequest) -> MoveBB8CustomResponse:
    print("My_callback has been called")
    cmd_vel_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=10)

    # Wait until publisher is registered with master
    while cmd_vel_publisher.get_num_connections() == 0 and not rospy.is_shutdown():
        rospy.sleep(0.1)

    cmd_vel_msg = Twist()
    cmd_vel_msg.linear.x = 1
    cmd_vel_msg.angular.z = 0.5

    response = MoveBB8CustomResponse()
    
    try:
        rate = rospy.Rate(1)
        idx = 0
        while not rospy.is_shutdown() and idx < request.duration:
            cmd_vel_publisher.publish(cmd_vel_msg)
            idx += 1
            rate.sleep()
        response.success = True
        return response
    except Exception:
        response.success = False
        return response
    finally:
        cmd_vel_msg.linear.x = 0
        cmd_vel_msg.angular.z = 0
        cmd_vel_publisher.publish(cmd_vel_msg)


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_custom_node')
    my_service = rospy.Service('/move_bb8_in_circle_custom', MoveBB8Custom, my_callback)
    rospy.spin()