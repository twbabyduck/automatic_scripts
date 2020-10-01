OPENCV_VERSION=3.4.11
OPENCV_SOURCE_DIR=$HOME/Library
# Save current working directory
sudo apt -y update

## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm
sudo apt -y install git gfortran
sudo apt -y install libpng-dev
 
sudo apt -y install libtiff5-dev libtiff-dev

sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev v4l-utils qv4l2 v4l2ucp
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
 
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 libx264-dev

# GL (Jetson need patch)
sudo apt -y install libgl1 libglvnd-dev

# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# Python 2.7
sudo apt-get install -y python-dev python-numpy python-py python-pytest

# Python 3.6
sudo apt-get install -y python3-dev python3-numpy python3-py python3-pytest
	
# GStreamer support
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 

cd $OPENCV_SOURCE_DIR
git clone https://github.com/opencv/opencv_extra.git
cd opencv_extra
git checkout -b v${OPENCV_VERSION} ${OPENCV_VERSION}

cd $OPENCV_SOURCE_DIR
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout -b v${OPENCV_VERSION} ${OPENCV_VERSION}

cd $OPENCV_SOURCE_DIR
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout -b v${OPENCV_VERSION} ${OPENCV_VERSION}

mkdir build
cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DBUILD_PNG=OFF \
        -DBUILD_TIFF=OFF \
        -DBUILD_TBB=ON \
        -DBUILD_JPEG=OFF \
        -DBUILD_JASPER=OFF \
        -DBUILD_ZLIB=OFF \
	-DENABLE_FAST_MATH=ON \
        -DBUILD_EXAMPLES=ON \
        -DBUILD_opencv_java=OFF \
        -DBUILD_opencv_python2=OFF \
        -DBUILD_opencv_python3=ON \
        -DWITH_OPENCL=OFF \
        -DWITH_OPENMP=ON \
        -DWITH_FFMPEG=ON \
        -DWITH_GSTREAMER=ON \
        -DWITH_GSTREAMER_0_10=OFF \
        -DWITH_CUDA=ON \
	-DWITH_CUBLAS=ON \
        -DWITH_GTK=ON \
        -DWITH_VTK=OFF \
        -DWITH_1394=OFF \
        -DWITH_OPENEXR=OFF \
        -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
	-DCUDA_NVCC_FLAGS="--expt-relaxed-constexpr" \
	-DWITH_QT=ON \
        -DWITH_OPENGL=ON \
        -DWITH_LAPACK=OFF \
        -DINSTALL_C_EXAMPLES=ON \
        -DINSTALL_TESTS=ON \
        -DOPENCV_EXTRA_MODULES_PATH=$OPENCV_SOURCE_DIR/opencv_contrib/modules \
        -DOPENCV_TEST_DATA_PATH=$OPENCV_SOURCE_DIR/opencv_extra/testdata \
        ../
sudo make -j"$(nproc)" install
