#!/bin/bash
# *******************************
# Patch for PolyBench-ACC
# - Gunjae Koo (gunjae.koo@gmail.com)
# *******************************

source ../common.config

cp -i polybench/compile_cuda.sh ${POLYBENCH_PATH}
cp -i polybench/common.mk ${POLYBENCH_PATH}/CUDA/utilities
