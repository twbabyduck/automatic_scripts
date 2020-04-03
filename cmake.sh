#!/bin/bash
git clone https://github.com/Kitware/CMake ~/cmake && \
cd ~/cmake && \
git checkout v3.17.0 && \
./bootstrap && \
sudo make -j"$(nproc)" install
