#!/bin/bash
# *********************************
# Patch for CUDA SDK 4.2.9
# - Gunjae Koo (gunjae.koo@gmail.com)
# - Information from https://devtalk.nvidia.com/default/topic/520958/cuda-programming-and-performance/cuda-4-2-install-in-ubuntu-12-04/
# *********************************

source ../common.config

echo "This patch will replace Makefiles"

echo "cp -i sdk/common.mk ${CUDA_SDK_PATH}/C/common/common.mk"
cp -i sdk/common.mk ${CUDA_SDK_PATH}/C/common/common.mk
echo "cp -i sdk/common_cudalib.mk ${CUDA_SDK_PATH}/CUDALibraries/common/common_cudalib.mk"
cp -i sdk/common_cudalib.mk ${CUDA_SDK_PATH}/CUDALibraries/common/common_cudalib.mk

echo "cp -i sdk/Makefile.boxFilterNPP ${CUDA_SDK_PATH}/CUDALibraries/src/boxFilterNPP/Makefile"
cp -i sdk/Makefile.boxFilterNPP ${CUDA_SDK_PATH}/CUDALibraries/src/boxFilterNPP/Makefile
echo "cp -i sdk/Makefile.freeImageInteropNPP ${CUDA_SDK_PATH}/CUDALibraries/src/freeImageInteropNPP/Makefile"
cp -i sdk/Makefile.freeImageInteropNPP ${CUDA_SDK_PATH}/CUDALibraries/src/freeImageInteropNPP/Makefile
echo "cp -i sdk/Makefile.histEqualizationNPP ${CUDA_SDK_PATH}/CUDALibraries/src/histEqualizationNPP/Makefile"
cp -i sdk/Makefile.histEqualizationNPP ${CUDA_SDK_PATH}/CUDALibraries/src/histEqualizationNPP/Makefile
echo "cp -i sdk/Makefile.imageSegmentationNPP ${CUDA_SDK_PATH}/CUDALibraries/src/imageSegmentationNPP/Makefile"
cp -i sdk/Makefile.imageSegmentationNPP ${CUDA_SDK_PATH}/CUDALibraries/src/imageSegmentationNPP/Makefile
echo "cp -i sdk/Makefile.randomFog ${CUDA_SDK_PATH}/CUDALibraries/src/randomFog/Makefile"
cp -i sdk/Makefile.randomFog ${CUDA_SDK_PATH}/CUDALibraries/src/randomFog/Makefile
