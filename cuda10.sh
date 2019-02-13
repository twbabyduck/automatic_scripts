#!/bin/bash
# install CUDA Toolkit v10.0
# instructions from https://developer.nvidia.com/cuda-downloads (linux -> x86_64 -> Ubuntu -> 16.04 -> deb)
CUDA_REPO_PKG="cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64"
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/${CUDA_REPO_PKG}
sudo dpkg -i ${CUDA_REPO_PKG}
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
