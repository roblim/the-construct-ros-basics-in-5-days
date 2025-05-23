#! /usr/bin/env python

import rospy                                          
from std_msgs.msg import Int32 

# Define a function called 'callback' that receives a parameter named 'msg'
def callback(msg):  
    print (msg.data)  # Print the value 'data' inside the 'msg' parameter

rospy.init_node('topic_subscriber')  # Initiate a Node called 'topic_subscriber'

# Create a Subscriber object that will listen to the /counter
# topic and will call the 'callback' function each time it reads
# something from the topic
sub = rospy.Subscriber('/counter', Int32, callback)  

rospy.spin()  # Create a loop that will keep the program in execution