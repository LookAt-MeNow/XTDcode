#!/bin/bash
gnome-terminal -- bash -c  "cd ~/PX4_Firmware; roslaunch px4 indoor1.launch"
echo 请等待gazebo完全启动
sleep 7
gnome-terminal -- bash -c  "roslaunch hector_slam_launch hector_slam_xtdrone.launch"
echo 启动二维激光SLAM
sleep 5
gnome-terminal -- bash -c  "cd ~/XTDrone/communication; python multirotor_communication.py iris 0"
echo 正在建立通信
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/sensing/slam/laser_slam/script; python laser_transfer.py iris 0 hector"
echo 将激光水平定位和高度真值数据通过MAVROS发给PX4
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/motion_planning/2d/launch; roslaunch 2d_motion_planning.launch"
echo 启动运动规划
sleep 5
gnome-terminal -- bash -c  "cd ~/XTDrone/control/keyboard; python multirotor_keyboard_control.py iris 1 vel"
echo 在终端中启动无人机起飞
sleep 5
echo 无人机一个2D Nav Goal，控制无人机按照规划的路径飞去，得到地图
wait
exit 0

