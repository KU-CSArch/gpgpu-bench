#!/bin/bash
# **********************************
# Polybench CUDA compile script
# - Gunjae Koo (gunjae.koo@gmail.com)
# **********************************

source ../common.config

BIN_PATH=${POLYBENCH_PATH}/CUDA/bin

if [ -d ${BIN_PATH} ]; then
	rm -rf ${BIN_PATH}
fi
mkdir -p ${BIN_PATH}

APP1_PATH=${POLYBENCH_PATH}/CUDA/datamining
APP2_PATH=${POLYBENCH_PATH}/CUDA/linear-algebra/kernels
APP3_PATH=${POLYBENCH_PATH}/CUDA/linear-algebra/solvers
APP4_PATH=${POLYBENCH_PATH}/CUDA/stencils

APP1=`ls ${APP1_PATH}`
APP2=`ls ${APP2_PATH}`
APP3=`ls ${APP3_PATH}`
APP4=`ls ${APP4_PATH}`

for i in ${APP1}; do
	(cd ${APP1_PATH}/${i} && make && cp *.exe ${BIN_PATH})
done
for i in ${APP2}; do
	(cd ${APP2_PATH}/${i} && make && cp *.exe ${BIN_PATH})
done
for i in ${APP3}; do
	(cd ${APP3_PATH}/${i} && make && cp *.exe ${BIN_PATH})
done
for i in ${APP4}; do
	(cd ${APP4_PATH}/${i} && make && cp *.exe ${BIN_PATH})
done

echo "--- done ---"
