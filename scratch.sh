rostopic pub -r 1 /cmd_vel geometry_msgs/Twist \
  '{linear: {x: 1.0, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 0.5}}'