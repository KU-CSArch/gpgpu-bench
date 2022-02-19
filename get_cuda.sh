#!/bin/bash
# *******************************************
# Getting CUDA toolkit and SDK
# - Gunjae Koo (gunjae.koo@gmail.com)
# *******************************************

source common.config

# pre-installed GCC version
CC_OLD_VER=4.8

# functions
function confirm() {
	# call with a prompt string or use a default
	read -r -p "Will you install $1? [y/N] " response
	case $response in
		[yY][eE][sS]|[yY])
			true
			;;
		*)
			false
			;;
	esac
}

echo "**********************************************"
echo " First set common.config"
echo "**********************************************"

echo "**********************************************"
echo " gcc/g++-4.4 installation"
echo "**********************************************"
confirm "gcc-4.4" && \
	sudo apt-get install gcc-4.4 g++ g++-4.4 && \
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 10 && \
	sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${CC_OLD_VER} 20 && \
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.4 10 && \
	sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${CC_OLD_VER} 20 && \
	sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30 && \
	sudo update-alternatives --set cc /usr/bin/gcc && \
	sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30 && \
	sudo update-alternatives --set c++ /usr/bin/g++ && \
	sudo update-alternatives --config gcc && \
	sudo update-alternatives --config g++

echo "**********************************************"
echo " Install nvidia driver (will work only on Ubuntu 12.04)"
echo "**********************************************"
confirm "nvidia drivers" && \
	sudo apt-get install nvidia-current nvidia-304 libcudart5.5

echo "**********************************************"
echo " Install dependent libraries"
echo "**********************************************"
confirm "dependent libraries" && \
	sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

echo "**********************************************"
echo " Install CUDA and SDK (SDK target directory = ~/workspace/cuda_sdk4)"
echo "**********************************************"
confirm "install CUDA and SDK" && \
	wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/toolkit/cudatoolkit_4.2.9_linux_64_ubuntu11.04.run && \
	wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/sdk/gpucomputingsdk_4.2.9_linux.run && \
	chmod 755 *.run && \
	sudo ./cudatoolkit_4.2.9_linux_64_ubuntu11.04.run && \
	./gpucomputingsdk_4.2.9_linux.run

echo "**********************************************"
echo " Apply patch"
echo "**********************************************"
confirm "patch" && \
	(cd patch && ./patch_sdk.sh)

echo "**********************************************"
echo " Add environment settings in .bashrc"
echo "**********************************************"
echo "PATH=$PATH:/usr/local/cuda/bin"
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/lib"
echo "export CUDA_INSTALL_PATH=/usr/local/cuda"
echo "export NVIDIA_COMPUTE_SDK_LOCATION=~/workspace/cuda_sdk4"
#echo "export NVIDIA_COMPUTE_SDK_LOCATION=~/bin/NVIDIA_GPU_Computing_SDK4"

echo "---- done ----"
