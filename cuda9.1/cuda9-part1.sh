#!/usr/bin/env bash

sudo apt-get remove -y nvidia-*
sudo apt-get remove -y cuda*
sudo apt-get remove -y libcuff*

sudo modprobe -r nouveau
sudo apt-get install nvidia-driver-390 nvidia-headless-390 nvidia-utils-390
sudo modprobe -i nvidia

cd ~/Documents && mkdir cuda9 && cd cuda9
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_387.26_linux 
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/1/cuda_9.1.85.1_linux 
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/2/cuda_9.1.85.2_linux
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/3/cuda_9.1.85.3_linux

sudo sh cuda_9.1.85_387.26_linux --override --toolkit --silent
sudo sh cuda_9.1.85.1_linux --accept-eula --silent
sudo sh cuda_9.1.85.2_linux --accept-eula --silent
sudo sh cuda_9.1.85.3_linux --accept-eula --silent

echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/cuda/bin"' | sudo tee /etc/environment
echo /usr/local/cuda-9.1/lib64 | sudo tee /etc/ld.so.conf.d/cuda-9.1.conf
sudo ldconfig

sudo reboot

