#!/bin/bash
gnome-terminal -- bash -c  "cd ~/PX4_Firmware; roslaunch px4 indoor1.launch"
echo 请等待gazebo完全启动
sleep 8
gnome-terminal -- bash -c  "cd ~/catkin_3d; bash scripts/xtdrone_run_vio.sh"
echo 启动VINS_Fuison
sleep 5
gnome-terminal -- bash -c  "cd ~/XTDrone/sensing/slam/vio; python vins_transfer.py iris 0"
echo 转化VINS-Fusion话题类型
sleep 2
gnome-terminal -- bash -c  "roslaunch vins rtabmap_vins.launch"
echo 进行三维稠密重建
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/communication; python multirotor_communication.py iris 0"
echo 正在建立通信
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/control/keyboard; python multirotor_keyboard_control.py iris 1 vel"
echo 请在终端中起飞无人机,起飞后悬停后关闭键盘控制
sleep 10
echo 请起飞后悬停,关闭键盘控制
sleep 10
gnome-terminal -- bash -c  "cd ~/XTDrone/motion_planning/3d; python ego_transfer.py iris 0"
echo 转换相机位姿的坐标系方向
sleep 2
gnome-terminal -- bash -c  "cd ~/XTDrone/motion_planning/3d; rviz -d ego_rviz.rviz"
echo 启动rviz 
sleep 5
gnome-terminal -- bash -c  "roslaunch ego_planner single_uav.launch"
echo 启动ego_planner
sleep 1
wait
exit 0

