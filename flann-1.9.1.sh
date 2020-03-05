git clone https://github.com/mariusmuja/flann -b 1.9.1
cd flann
git apply ../flann_cuda.patch
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CUDA_LIB=ON ..
sudo make -j$(($(nproc)-1)) install
