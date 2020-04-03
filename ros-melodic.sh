# !/bin/bash
# Install Robot Operating System (ROS)
# Information from: http://wiki.ros.org/melodic/Installation/Ubuntu

### Configure repositories
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

### Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

### Setup keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

### Installation
sudo apt-get update
sudo apt-get install ros-melodic-ros-base -y

### Add Specific Packages here
# sudo apt-get install ros-melodic-pcl-msgs

### Certificates Issues
# ERROR: cannot download default sources list from:  
# https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/sources.list.d/20-default.list  
# Website may be down.
###  
# sudo c_rehash /etc/ssl/certs

### Install bootstrap dependencies
sudo apt-get install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential

### Initialize rosdep
sudo rosdep init
rosdep update

### Environment Setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
