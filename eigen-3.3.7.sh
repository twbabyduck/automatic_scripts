cd && wget https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz #Download Eigen
mkdir eigen && tar --strip-components=1 -xzvf eigen-3.3.7.tar.gz -C eigen #Decompress
cd eigen && mkdir build && cd build && cmake .. && make && sudo make install #Build and install
cd && rm -rf eigen-3.3.7.tar.gz && rm -rf eigen #Remove downloaded and temporary files
