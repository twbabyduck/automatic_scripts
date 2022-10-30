# !/bin/bash
# Install Robot Operating System (ROS)
# Information from: http://wiki.ros.org/noetic/Installation/Ubuntu

### Configure repositories
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

sudo apt install curl # if you haven't already installed curl

### Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
### Setup keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

### Installation
sudo apt-get update
sudo apt-get install ros-noetic-ros-base -y

### Add Specific Packages here
# sudo apt-get install ros-noetic-pcl-msgs

### Certificates Issues
# ERROR: cannot download default sources list from:  
# https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/sources.list.d/20-default.list  
# Website may be down.
###  
# sudo c_rehash /etc/ssl/certs

### Install bootstrap dependencies
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

### Initialize rosdep
sudo rosdep init
rosdep update

### Environment Setup
echo "alias noetic=\"source /opt/ros/noetic/setup.bash;echo 'Noetic is Active'\"" >> ~/.bashrc
source ~/.bashrc
