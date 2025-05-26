#! /usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geographic_msgs.msg import Twist

"""
Create a Publisher that writes into the /cmd_vel topic in order to move the robot.

rostopic info /cmd_vel
Type: geometry_msgs/Twist
    geometry_msgs/Vector3 linear
    float64 x
    float64 y
    float64 z
    geometry_msgs/Vector3 angular
    float64 x
    float64 y
    float64 z

Create a Subscriber that reads from the /kobuki/laser/scan topic. This is the topic where the laser publishes its data.

rostopic info /kobuki/laser/scan
Type: sensor_msgs/LaserScan
    std_msgs/Header header
    uint32 seq
    time stamp
    string frame_id
    float32 angle_min
    float32 angle_max
    float32 angle_increment
    float32 time_increment
    float32 scan_time
    float32 range_min
    float32 range_max
    float32[] ranges
    float32[] intensities

Depending on the readings you receive from the laser's topic, you'll have to change the data you're sending to the /cmd_vel topic in order to avoid the wall. This means, use the values of the laser to decide.
Your program should follow the following logic:

If the laser reading in front of the robot is higher than 1 meter (there is no obstacle closer than 1 meter in front of the robot), the robot will move forward.
If the laser reading in front of the robot is lower than 1 meter (there is an obstacle closer than 1 meter in front of the robot), the robot will turn left.
If the laser reading at the right side of the robot is lower than 1 meter (there is an obstacle closer than 1 meter at the right side of the robot), the robot will turn left.
If the laser reading at the left side of the robot is lower than 1 meter (there is an obstacle closer than 1 meter at the left side of the robot), the robot will turn right.
"""

def callback(msg: LaserScan):  
    print (msg)  # Print the value 'data' inside the 'msg' parameter

rospy.init_node('topics_quiz_node')

sub = rospy.Subscriber("/kobuki/laser/scan", LaserScan, callback)  

rospy.spin()  # Create a loop that will keep the program in execution