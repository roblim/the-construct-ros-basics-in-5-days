#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist            

rospy.init_node('SimpleMove')

pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)    
                                           
rate = rospy.Rate(2)
twist_msg = Twist()
twist_msg.linear.x = 0.5
# pub.publish(twist_msg)

# Create a loop that will go until someone stops the program execution
while not rospy.is_shutdown():
  # Publish the message within the 'count' variable
  pub.publish(twist_msg)
  # Make sure the publish rate maintains at 2 Hz
  rate.sleep()