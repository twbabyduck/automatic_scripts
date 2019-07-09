### Install Prerequisites
sudo apt-get -y install git build-essential cmake cmake-curses-gui libboost-all-dev libeigen3-dev libflann-dev libglew-dev libxmu-dev libsuitesparse-dev libqhull-dev libpcap-dev libxi-dev libgtest-dev libproj-dev libusb-1.0-0-dev

## Warning: The PCL (1.8.x) version of PCL adds support for VTK 6 and Qt 5, 
## so if you want to use them, you must install the following packages (say yes if you are asked to remove VTK 5 and Qt 4 packages)

#### VTK6 + Qt5
sudo apt-get -y install libvtk6-qt-dev

### Compile and Install PCL
git clone https://github.com/PointCloudLibrary/pcl.git -b pcl-1.9.1
cd pcl
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CUDA=ON -DBUILD_GPU=ON -DWITH_QHULL=ON ..
sudo make -j"$(nproc)" install
## If you get `internal compiler error: Killed` then use the following command to decrease the number of jobs run in parallel.
# sudo make -j$(($(nproc)-1)) install
