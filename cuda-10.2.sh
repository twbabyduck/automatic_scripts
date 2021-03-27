#!/bin/bash
# install CUDA Toolkit v10.2
# instructions from https://developer.nvidia.com/cuda-downloads (linux -> x86_64 -> Ubuntu -> 18.04 -> deb)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

# Patch 1 (Aug 26, 2020)
wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/1/cuda-repo-ubuntu1804-10-2-local_10.2.1-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local_10.2.1-1_amd64.deb

# Patch 2 (Nov 17, 2020)
wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/2/cuda-repo-ubuntu1804-10-2-local_10.2.2-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local_10.2.2-1_amd64.deb

# set environment variables
echo "export PATH=${PATH}:/usr/local/cuda/bin" >> ~/.bashrc
echo "export CUDA_HOME=${CUDA_HOME}:/usr/local/cuda:/usr/local/cuda" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64" >> ~/.bashrc
source ~/.bashrc

# clean up
rm -rf cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb cuda-repo-ubuntu1804-10-2-local_10.2.1-1_amd64.deb cuda-repo-ubuntu1804-10-2-local_10.2.2-1_amd64.deb
