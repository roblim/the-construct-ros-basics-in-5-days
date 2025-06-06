#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
import time

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

class TopicsQuiz():

    def __init__(self):
        rospy.init_node('topics_quiz_node', anonymous=True)

        rospy.loginfo("Robot Turtlebot...")      
        self._check_laser_ready()

        # We start the publisher
        self.vel_publisher = rospy.Publisher("/cmd_vel", Twist, queue_size=1)
        self.cmd = Twist()        

        self.laser_subscriber = rospy.Subscriber(
            '/kobuki/laser/scan', LaserScan, self.laser_callback)
        
        self.ctrl_c = False
        self.rate = rospy.Rate(1)
        rospy.on_shutdown(self.shutdownhook)

    def _check_laser_ready(self):
        self.laser_msg = None
        rospy.loginfo("Checking Laser...")
        while self.laser_msg is None and not rospy.is_shutdown():
            try:
                self.laser_msg = rospy.wait_for_message("/kobuki/laser/scan", LaserScan, timeout=1.0)
                rospy.logdebug("Current /kobuki/laser/scan READY=>" + str(self.laser_msg))

            except:
                rospy.logerr("Current /kobuki/laser/scan not ready yet, retrying for getting scan")
        rospy.loginfo("Checking Laser...DONE")
        return self.laser_msg

    def publish_once_in_cmd_vel(self):
        """
        This is because publishing in topics sometimes fails the first time you publish.
        In continuous publishing systems, this is no big deal, but in systems that publish only
        once, it IS very important.
        """
        while not self.ctrl_c:
            connections = self.vel_publisher.get_num_connections()
            if connections > 0:
                self.vel_publisher.publish(self.cmd)
                #rospy.loginfo("Cmd Published")
                break
            else:
                self.rate.sleep()

    def shutdownhook(self):
        # works better than the rospy.is_shutdown()
        self.ctrl_c = True

    def laser_callback(self, msg):
        self.laser_msg = msg

    def get_laser(self, pos):
        time.sleep(1)
        return self.laser_msg.ranges[pos]

    def get_front_laser(self):
        time.sleep(1)
        return self.laser_msg.ranges[360]

    def get_left_laser(self):
        time.sleep(1)
        return self.laser_msg.ranges[719]

    def get_right_laser(self):
        time.sleep(1)
        return self.laser_msg.ranges[0]

    def get_laser_full(self):
        time.sleep(1)
        return self.laser_msg.ranges

    def stop_robot(self):
        #rospy.loginfo("shutdown time! Stop the robot")
        self.cmd.linear.x = 0.0
        self.cmd.angular.z = 0.0
        self.publish_once_in_cmd_vel()

    def move_straight(self):
        # Initilize velocities
        self.cmd.linear.x = 0.25
        self.cmd.linear.y = 0
        self.cmd.linear.z = 0
        self.cmd.angular.x = 0
        self.cmd.angular.y = 0
        self.cmd.angular.z = 0

        # Publish the velocity
        self.publish_once_in_cmd_vel()

    def turn_left(self):
        # Initilize velocities
        self.cmd.linear.x = 0.125
        self.cmd.linear.y = 0
        self.cmd.linear.z = 0
        self.cmd.angular.x = 0
        self.cmd.angular.y = 0

        self.cmd.angular.z = 1.57

        # Publish the velocity
        self.publish_once_in_cmd_vel()

    def turn_right(self):
        # Initilize velocities
        self.cmd.linear.x = 0.125
        self.cmd.linear.y = 0
        self.cmd.linear.z = 0
        self.cmd.angular.x = 0
        self.cmd.angular.y = 0

        self.cmd.angular.z = -1.57

        # Publish the velocity
        self.publish_once_in_cmd_vel()

    def start(self):
        while not rospy.is_shutdown():
            if self.get_front_laser() >= 1:
                self.move_straight()
            elif self.get_front_laser() < 1 or self.get_right_laser() < 1:
                self.turn_left()
            elif self.get_left_laser() < 1:
                self.turn_right()


if __name__ == '__main__':
    
    topics_quiz_object = TopicsQuiz()
    try:
        topics_quiz_object.start()

    except rospy.ROSInterruptException:
        pass