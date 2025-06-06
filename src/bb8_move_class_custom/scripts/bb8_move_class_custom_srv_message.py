#! /usr/bin/env python

from typing import Optional
import rospy
from geometry_msgs.msg import Twist

class MoveBB8Custom():
    
    def __init__(self):
        self.bb8_vel_publisher = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
        self.cmd = Twist()
        self.ctrl_c = False
        self.rate = rospy.Rate(10) # 10hz
        rospy.on_shutdown(self.shutdownhook)
        
    def publish_once_in_cmd_vel(self):
        """
        This is because publishing in topics sometimes fails the first time you publish.
        In continuous publishing systems, this is no big deal, but in systems that publish only
        once, it IS very important.
        """
        while not self.ctrl_c:
            connections = self.bb8_vel_publisher.get_num_connections()
            if connections > 0:
                self.bb8_vel_publisher.publish(self.cmd)
                rospy.loginfo("Cmd Published")
                break
            else:
                self.rate.sleep()
        
    def shutdownhook(self):
        # works better than the rospy.is_shutdown()
        self.ctrl_c = True

    def stop_bb8(self) -> None:
        rospy.loginfo("Stopping BB8!")
        stop_msg = Twist()
        stop_msg.linear.x = 0
        stop_msg.angular.z = 0
        self.bb8_vel_publisher.publish(stop_msg)

    def move_bb8(self, linear_speed=0.2, angular_speed=0.2, duration: Optional[int] = None):
        
        self.cmd.linear.x = linear_speed
        self.cmd.angular.z = angular_speed
        
        rospy.loginfo("Moving BB8!")

        if duration:
            orig_rate = self.rate
            self.rate = rospy.Rate(1)
            idx = 0
            while idx < duration:
                self.publish_once_in_cmd_vel()
                idx += 1
                self.rate.sleep()
            self.rate = orig_rate
            self.stop_bb8()
        else:
            self.publish_once_in_cmd_vel()
            
if __name__ == '__main__':
    rospy.init_node('move_bb8_test', anonymous=True)
    movebb8_object = MoveBB8Custom()
    try:
        movebb8_object.move_bb8()
    except rospy.ROSInterruptException:
        pass