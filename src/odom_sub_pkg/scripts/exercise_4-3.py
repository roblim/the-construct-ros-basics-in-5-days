#! /usr/bin/env python

import rospy                                          
from nav_msgs.msg import Odometry

def callback(msg):  
    print (msg)

rospy.init_node('odom_sub')  
sub = rospy.Subscriber('/odom', Odometry, callback)  

rospy.spin()