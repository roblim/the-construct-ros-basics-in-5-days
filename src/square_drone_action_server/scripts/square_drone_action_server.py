#! /usr/bin/env python
import rospy
import time
from actionlib import SimpleActionServer
from actionlib.msg import TestAction, TestFeedback, TestResult
from geometry_msgs.msg import Twist
from std_msgs.msg import Empty


class SquareDrone(object):
    
  # create messages that are used to publish feedback/result
  _feedback = TestFeedback()
  _result   = TestResult()

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
        name="square_drone_as",
        ActionSpec=TestAction,
        execute_cb=self.goal_callback,
        auto_start=False
    )
    self._as.start()

  def takeoff(self, duration=3):
      rospy.loginfo('Taking off...')
      for _ in range(duration):
          self.takeoff_pub.publish(self.takeoff_msg)
          time.sleep(1)

  def land(self, duration=3):
      rospy.loginfo('Landing...')
      for _ in range(duration):
          self.move_msg.linear.x = 0
          self.move_msg.linear.y = 0
          self.move_msg.angular.z = 0
          self.move_pub.publish(self.move_msg)
          self.land_pub.publish(self.land_msg)
          time.sleep(1)

  def stop(self):
    self.move_msg.linear.x = 0
    self.move_msg.linear.y = 0
    self.move_msg.angular.z = 0
    self.move_pub.publish(self.move_msg)

  def move_drone_fwd(self, duration=1):
      rospy.loginfo(f"Moving forward for {duration}s...")
      for _ in range(duration):
        self.move_msg.linear.x = 1
        self.move_msg.linear.y = 0
        self.move_msg.angular.z = 0
        self.move_pub.publish(self.move_msg)
        time.sleep(1)
      self.stop()

  def move_drone_bwd(self, duration=1):
      rospy.loginfo(f"Moving backward for {duration}s...")
      for _ in range(duration):
        self.move_msg.linear.x = -1.0
        self.move_msg.linear.y = 0
        self.move_msg.angular.z = 0
        self.move_pub.publish(self.move_msg)
        time.sleep(1)
      self.stop()

  def move_drone_right(self, duration=1):
      rospy.loginfo(f"Moving right for {duration}s...")
      for _ in range(duration):
        self.move_msg.linear.x = 0
        self.move_msg.linear.y = -1
        self.move_msg.angular.z = 0
        self.move_pub.publish(self.move_msg)
        time.sleep(1)

  def move_drone_left(self, duration=1):
      rospy.loginfo(f"Moving left for {duration}s...")
      for _ in range(duration):
        self.move_msg.linear.x = 0
        self.move_msg.linear.y = 1
        self.move_msg.angular.z = 0
        self.move_pub.publish(self.move_msg)
        time.sleep(1)
      self.stop()

  def move_drone_square(self, duration_per_side=1):
    rospy.loginfo(f"Moving in square for {duration_per_side}s per side...")
    self.move_drone_fwd(duration=duration_per_side)
    self.move_drone_right(duration=duration_per_side)
    self.move_drone_bwd(duration=duration_per_side)
    self.move_drone_left(duration=duration_per_side)

  def goal_callback(self, goal):
    # this callback is called when the action server is called.
    
    # helper variables
    r = rospy.Rate(1)
    success = True
    
    # publish info to the console for the user
    square_side_length_m = goal.goal
    rospy.loginfo(f'"square_drone_as": Executing action, with goal of moving drone in a {square_side_length_m}m square.')
    
    square_moves = [self.move_drone_fwd, self.move_drone_right, self.move_drone_bwd, self.move_drone_left]
    
    self.takeoff()
    start_time = time.time()
    for square_side_num, move_method in enumerate(square_moves, start=1):
    
      # check that preempt (cancelation) has not been requested by the action client
      if self._as.is_preempt_requested():
        rospy.loginfo('The goal has been cancelled/preempted')
        # the following line, sets the client in preempted state (goal cancelled)
        self._as.set_preempted()
        success = False
        # we end the square moves and land
        self.land()
        break
      
      # builds the next feedback msg to be sent
      self._feedback.feedback = square_side_num
      # publish the feedback
      self._as.publish_feedback(self._feedback)
      move_method(duration=square_side_length_m)
    
    end_time = time.time()
    self.land()
    elapsed_time_s = int(end_time - start_time)

    # at this point, either the goal has been achieved (success==true)
    # or the client preempted the goal (success==false)
    # If success, then we publish the final result
    # If not success, we do not publish anything in the result
    if success:
      self._result.result = elapsed_time_s
      rospy.loginfo(f"Succeeded moving drone in {square_side_length_m}m square, over {elapsed_time_s}s.")
      self._as.set_succeeded(self._result)
      
if __name__ == '__main__':
  rospy.init_node('square_drone_node')
  SquareDrone()
  rospy.spin()