#!/usr/bin/env bash

nvidia-smi 
nvcc --version

echo "deb http://dk.archive.ubuntu.com/ubuntu/ bionic main universe" | sudo tee -a /etc/apt/sources.list

sudo apt-get update 
sudo apt install gcc-6
sudo apt install g++-6

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 6
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 6

sudo update-alternatives --config gcc
sudo update-alternatives --config g++

gcc --version
g++ --version
sudo apt-get install -y fftw3-dev
