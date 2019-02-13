### Install Prerequisites
sudo apt-get -y install git build-essential cmake cmake-curses-gui libboost-all-dev libeigen3-dev libflann-dev libglew-dev libxmu-dev libsuitesparse-dev libqhull-dev libpcap-dev libxi-dev libgtest-dev libproj-dev libusb-1.0-0-dev

## Warning: The PCL (1.8.x) version of PCL adds support for VTK 6 and Qt 5, 
## so if you want to use them, you must install the following packages (say yes if you are asked to remove VTK 5 and Qt 4 packages)

#### VTK6 + Qt5
sudo apt-get -y install libvtk6-qt-dev

### Compile and Install PCL
git clone https://github.com/PointCloudLibrary/pcl.git
cd pcl
git checkout pcl-1.9.0
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CUDA=ON -DBUILD_GPU=ON ..
make
sudo make install
