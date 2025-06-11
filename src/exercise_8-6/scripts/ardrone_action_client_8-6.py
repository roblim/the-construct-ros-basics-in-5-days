#! /usr/bin/env python
import rospy
import time
import actionlib
from ardrone_as.msg import ArdroneAction, ArdroneGoal, ArdroneResult, ArdroneFeedback
from std_msgs.msg import Empty
from geometry_msgs.msg import Twist
from random import choice

nImage = 1

# definition of the feedback callback. This will be called when feedback
# is received from the action server
# it just prints a message indicating a new message has been received
def feedback_callback(feedback):
    global nImage
    print('[Feedback] image n.%d received'%nImage)
    nImage += 1

# initializes the action client node
rospy.init_node('Exercise_8_6_node')

# create the connection to the action server
client = actionlib.SimpleActionClient('/ardrone_action_server', ArdroneAction)
# waits until the action server is up and running
client.wait_for_server()

# creates a goal to send to the action server
goal = ArdroneGoal()
goal.nseconds = 20 # indicates, take pictures along 10 seconds

# sends the goal to the action server, specifying which feedback function
# to call when feedback received
client.send_goal(goal, feedback_cb=feedback_callback)

takeoff_pub = rospy.Publisher("/drone/takeoff", Empty, queue_size=1)
landing_pub = rospy.Publisher("/drone/land", Empty, queue_size=1)
cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)

fwd_twist = Twist()
fwd_twist.linear.x = 0.5
rev_twist = Twist()
rev_twist.linear.x = -0.5
left_twist = Twist()
left_twist.linear.x = 0.5
left_twist.angular.z = 0.5
right_twist = Twist()
right_twist.angular.z = -0.5
directions = [fwd_twist, rev_twist, left_twist, right_twist]

while takeoff_pub.get_num_connections() < 1 or landing_pub.get_num_connections() < 1 or cmd_vel_pub.get_num_connections() < 1:
    rospy.loginfo("Waiting for publishers...")


# Uncomment these lines to test goal preemption:
#time.sleep(3.0)
#client.cancel_goal()  # would cancel the goal 3 seconds after starting

# wait until the result is obtained
# you can do other stuff here instead of waiting
# and check for status from time to time 
# status = client.get_state()
# check the client API link below for more info

# We create some constants with the corresponing vaules from the SimpleGoalState class
PENDING = 0
ACTIVE = 1
PREEMPTED = 2
SUCCEEDED = 3

state_result = client.get_state()

rate = rospy.Rate(1)

rospy.loginfo("state_result: "+str(state_result))

takeoff_pub.publish(Empty())
while state_result < SUCCEEDED:
    rospy.loginfo("Moving drone while waiting for the Server to give a result....")
    cmd_vel_pub.publish(choice(directions))
    rate.sleep()
    state_result = client.get_state()
    rospy.loginfo("state_result: "+str(state_result))

landing_pub.publish(Empty())
rospy.loginfo("[Result] State: "+str(state_result))