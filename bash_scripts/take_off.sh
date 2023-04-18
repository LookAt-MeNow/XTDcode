#!/bin/bash
gnome-terminal -- bash -c "cd ~/PX4_Firmware; roslaunch px4 indoor1.launch"
echo 请等待gazebo完全启动
sleep 6

gnome-terminal -- bash -c "cd ~/XTDrone/communication; python multirotor_communication.py iris 0"
echo 正在建立通信
sleep 5

gnome-terminal -- bash -c "cd ~/XTDrone/control/keyboard; python multirotor_keyboard_control.py iris 1 vel"
echo 请在终端中起飞无人机
sleep 5
wait
exit 0
