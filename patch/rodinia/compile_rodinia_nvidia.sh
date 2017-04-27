#!/bin/bash
# ********************************************
# Compiling MARS benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# ********************************************

source ../common.config

RODINIA_APP_PATH=cuda
RODINIA_APP_NVIDIA="backprop cfd hotspot kmeans nw streamcluster bfs"
RODINIA_BIN_PATH=${RODINIA_PATH}/bin/linux/cuda

function make_links() {
	if [ -f common/common.mk.org ]; then
		rm common/common.mk
	else
		mv common/common.mk common/common.mk.org
	fi
	rm -f lib
	rm -f common/inc
	rm -f ../shared
	
	ln -s ${CUDA_SDK_PATH}/C/common/common.mk common/common.mk
	ln -s ${CUDA_SDK_PATH}/C/lib lib
	ln -s ${CUDA_SDK_PATH}/C/common/inc common/inc
	ln -s ${CUDA_SDK_PATH}/shared ../shared
}

echo "********************************"
echo " Making links"
echo "********************************"
make_links

echo "********************************"
echo " Cleaning"
echo "********************************"
rm -rf bin/linux/release
for i in ${RODNIA_APP_NVIDIA}; do
	(cd ${RODINIA_APP_PATH}/${i} && rm -rf obj)
	(cd ${RODINIA_APP_PATH}/${i} && make clean -f Makefile_nvidia)
done


echo "********************************"
echo " Compiling"
echo "********************************"
(cd ${CUDA_SDK_PATH} && make)
for i in ${RODINIA_APP_NVIDIA}; do
	echo ""
	echo ""
	echo "********************************"
	echo "${i}"
	echo "********************************"
	make_links
	(cd ${RODINIA_APP_PATH}/${i} && make -f Makefile_nvidia)
done

cp bin/linux/release/* ${RODINIA_BIN_PATH}

echo "--- done ---"
