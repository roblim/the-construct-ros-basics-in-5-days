#! /usr/bin/env python

import rospy
from move_bb8_in_circle_custom.srv import MoveBB8Custom, MoveBB8CustomRequest


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_custom_client_node')

    rospy.wait_for_service('/move_bb8_in_circle_custom')
    move_bb8_in_circle_service = rospy.ServiceProxy('/move_bb8_in_circle_custom', MoveBB8Custom)

    request = MoveBB8CustomRequest()
    request.duration = 5
    move_bb8_in_circle_service(request)