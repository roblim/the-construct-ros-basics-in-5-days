#! /usr/bin/env python

import rospy
from iri_wam_reproduce_trajectory.srv import ExecTraj, ExecTrajRequest
import rospkg

"""
rosservice info /execute_trajectory
    Node: /iri_wam_reproduce_trajectory
    URI: rosrpc://1_xterm:52385
    Type: iri_wam_reproduce_trajectory/ExecTraj
    Args: file

rossrv show iri_wam_reproduce_trajectory/ExecTraj
    string file
    ---

"""

rospack = rospkg.RosPack()
# This rospack.get_path() works in the same way as $(find name_of_package) in the launch files.
traj = rospack.get_path('iri_wam_reproduce_trajectory') + "/config/get_food.txt"

# Initialise a ROS node with the name service_client
rospy.init_node('execute_traj_node')
# Wait for the service client /execute_trajectory to be running
rospy.wait_for_service('/execute_trajectory')
# Create the connection to the service
execute_trajectory_service = rospy.ServiceProxy('/execute_trajectory', ExecTraj)
# Create an object of type TrajByNameRequest
execute_trajectory_object = ExecTrajRequest()
# Fill the variable file of this object with the desired value
execute_trajectory_object.file = traj
# Send through the connection the name of the trajectory to be executed by the robot
result = execute_trajectory_service(execute_trajectory_object)
# Print the result given by the service called
print(result)
