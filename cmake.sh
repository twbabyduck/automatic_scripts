#!/bin/bash
sudo apt install libssl-dev
cd && git clone https://github.com/Kitware/CMake cmake && \
cd cmake && \
git checkout v3.18.0 && \
./bootstrap && \
sudo make -j"$(nproc)" install
cd && rm -rf cmake
