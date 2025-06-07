#! /usr/bin/env python

import rospy
from bb8_move_class_custom.srv import BB8MoveServiceMessage, BB8MoveServiceMessageRequest, BB8MoveServiceMessageResponse
from bb8_move_class_custom_srv_message import MoveBB8Custom


def my_callback(request: BB8MoveServiceMessageRequest) -> BB8MoveServiceMessageResponse:
    print("My_callback has been called")
    bb8_obj = MoveBB8Custom()

    # Wait until publisher is registered with master
    while bb8_obj.bb8_vel_publisher.get_num_connections() == 0 and not bb8_obj.ctrl_c:
        rospy.sleep(0.1)

    response = BB8MoveServiceMessageResponse()
    try:
        bb8_obj.move_bb8(
            linear_speed=1,
            angular_speed=0.5,
            duration=request.duration
        )
        response.success = True
        return response
    except Exception as e:
        print("Error during '/move_bb8_in_circle_custom_class' service callback: ", e)
        response.success = False
        return response


if __name__ == "__main__":
    rospy.init_node('move_bb8_in_circle_custom_class_node')
    my_service = rospy.Service('/move_bb8_in_circle_custom_class', BB8MoveServiceMessage, my_callback)
    rospy.spin()