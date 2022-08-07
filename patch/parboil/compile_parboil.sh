#!/bin/bash
# **************************************
# Compiling Parboil
# - Gunjae Koo (gunjae.koo@gmail.com)
# **************************************

source ../common.config

PARBOIL_APP="bfs stencil tpacf cutcp mri-gridding sad spmv histo sgemm mri-q lbm"

echo "****************************************"
echo " Compiling..."
echo "****************************************"
for i in ${PARBOIL_APP}; do
	echo ""
	echo ""
	echo "****************************************"
	echo " ${i}"
	echo "****************************************"
	./parboil clean ${i}
	./parboil compile ${i} cuda
	cp -f ${PARBOIL_PATH}/benchmarks/${i}/build/cuda_default/${i} ${PARBOIL_PATH}/bin/.
done

