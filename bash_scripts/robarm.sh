#!/bin/bash
gnome-terminal -- bash -c  "roslaunch le_arm_moveit_config demo.launch"
echo 正在启动moveit机械臂控制界面...
sleep 7
gnome-terminal -- bash -c  "roslaunch px4 iris_arm.launch"
echo 正在启动gazebo仿真界面...
sleep 8
gnome-terminal -- bash -c  "cd ~/XTDrone/communication; python multirotor_communication.py iris 0"
echo 正在建立通信...
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/sensing/pose_ground_truth; python get_local_pose.py iris 1"
echo 正在获得位姿真值...
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/control/keyboard; python multirotor_keyboard_control.py iris 1 vel"
echo 请在终端中起飞无人机
wait
exit 0

