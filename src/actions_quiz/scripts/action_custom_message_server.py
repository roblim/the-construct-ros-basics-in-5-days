#! /usr/bin/env python
import rospy
import time
from actionlib import SimpleActionServer

from actions_quiz.msg import CustomActionMsgAction, CustomActionMsgFeedback, CustomActionMsgResult
from geometry_msgs.msg import Twist
from std_msgs.msg import Empty


class ActionsQuiz(object):
    
  # create messages that are used to publish feedback/result
  _feedback = CustomActionMsgFeedback()
  _result   = CustomActionMsgResult()
  TAKEOFF_KW = "TAKEOFF"
  LAND_KW = "LAND"

  def __init__(self):
    self.move_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    self.takeoff_pub = rospy.Publisher('/drone/takeoff', Empty, queue_size=1)
    self.land_pub = rospy.Publisher('/drone/land', Empty, queue_size=1)
    self.move_msg = Twist()
    self.takeoff_msg = Empty()
    self.land_msg = Empty()
    self.rate = rospy.Rate(1)

    # creates the action server
    self._as = SimpleActionServer(
        name="action_custom_msg_as",
        ActionSpec=CustomActionMsgAction,
        execute_cb=self.goal_callback,
        auto_start=False
    )
    self._as.start()

  def takeoff(self, duration=3):
      rospy.loginfo('Taking off...')
      for _ in range(duration):
          self.stop()
          self.takeoff_pub.publish(self.takeoff_msg)
          time.sleep(1)

  def land(self, duration=3):
      rospy.loginfo('Landing...')
      for _ in range(duration):
          self.stop()
          self.land_pub.publish(self.land_msg)
          time.sleep(1)

  def stop(self):
    self.move_msg.linear.x = 0
    self.move_msg.linear.y = 0
    self.move_msg.angular.z = 0
    self.move_pub.publish(self.move_msg)

  def goal_callback(self, goal):
    # this callback is called when the action server is called.
    
    # helper variables
    r = rospy.Rate(1)
    success = True
    
    # publish info to the console for the user
    goal = goal.goal
    rospy.loginfo(f'"action_custom_msg_as": Executing action, with goal: "{goal}".')
    
    for _ in range(3):
        # check that preempt (cancelation) has not been requested by the action client
        if self._as.is_preempt_requested():
            rospy.loginfo('The goal has been cancelled/preempted')
            # the following line, sets the client in preempted state (goal cancelled)
            self._as.set_preempted()
            success = False
            # we end the square moves and land
            self.land()

        # builds the next feedback msg to be sent
        self._feedback.feedback = goal
        # publish the feedback
        self._as.publish_feedback(self._feedback)
        if goal == self.TAKEOFF_KW:
            self.takeoff(duration=1)
        if goal == self.LAND_KW:
            self.land(duration=1)
        r.sleep()
    


    # at this point, either the goal has been achieved (success==true)
    # or the client preempted the goal (success==false)
    # If success, then we publish the final result
    # If not success, we do not publish anything in the result
    if success:
      rospy.loginfo(f"Succeeded moving drone with goal: {goal}.")
      self._as.set_succeeded(self._result)
      
if __name__ == '__main__':
  rospy.init_node('actions_quiz_node')
  ActionsQuiz()
  rospy.spin()