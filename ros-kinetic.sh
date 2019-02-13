# !/bin/bash
# Install Robot Operating System (ROS)
# Information from: http://wiki.ros.org/kinetic/Installation/Ubuntu

### Configure repositories
sudo apt-add-repository universe
sudo apt-add-repository multiverse
sudo apt-add-repository restricted

### Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
### Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
### Installation
sudo apt-get update
sudo apt-get install ros-kinetic-ros-base -y

### Add Specific Packages here
# sudo apt-get install ros-kinetic-pcl-msgs

### Certificates Issues
# ERROR: cannot download default sources list from:  
# https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/sources.list.d/20-default.list  
# Website may be down.
###  
# sudo c_rehash /etc/ssl/certs

sudo rosdep init
rosdep update

### Environment Setup
### make sure put at the first line in the bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib/aarch64-linux-gnu" >> ~/.bashrc
source ~/.bashrc
