#! /usr/bin/env python

import rospy
from custom_age_msg_pkg.msg import Age

rospy.init_node('CustomAgeMsg')

pub = rospy.Publisher('/age', Age, queue_size=1)    
                                           
rate = rospy.Rate(2)
age = Age()
age.years = 10
age.months = 2
age.days = 3

# Create a loop that will go until someone stops the program execution
while not rospy.is_shutdown():
  pub.publish(age)
  # Make sure the publish rate maintains at 2 Hz
  rate.sleep()