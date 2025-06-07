#! /usr/bin/env python

import rospy
from bb8_move_class_custom.srv import BB8MoveServiceMessage, BB8MoveServiceMessageRequest, BB8MoveServiceMessageResponse


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_custom_class_client_node')

    rospy.wait_for_service('/move_bb8_in_circle_custom_class')
    move_bb8_in_circle_service = rospy.ServiceProxy('/move_bb8_in_circle_custom_class', BB8MoveServiceMessage)

    request = BB8MoveServiceMessageRequest()
    request.duration = 10
    move_bb8_in_circle_service(request)