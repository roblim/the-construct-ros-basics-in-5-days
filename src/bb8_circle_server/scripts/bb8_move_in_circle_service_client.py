#! /usr/bin/env python

import rospy
from std_srvs.srv import Empty, EmptyRequest # you import the service message python classes generated from Empty.srv.


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_client_node')

    rospy.wait_for_service('/move_bb8_in_circle')
    move_bb8_in_circle_service = rospy.ServiceProxy('/move_bb8_in_circle', Empty)

    move_bb8_in_circle_service(EmptyRequest())