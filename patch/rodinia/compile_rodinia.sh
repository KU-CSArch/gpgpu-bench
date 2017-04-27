#!/bin/bash
# **************************************
# Compiling Rodinia benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# **************************************

source ../common.config

RODINIA_APP_PATH=${RODINIA_PATH}/cuda
RODINIA_APP="b+tree dwt2d gaussian heartwall hotspot3D huffman hybridsort lavaMD leukocyte lud mummergpu myocyte nn particlefilter pathfinder srad/srad_v1 srad/srad_v2"
#RODINIA_APP="backprop bfs b+tree cfd dwt2d gaussian heartwall hotspot hotspot3D huffman hybridsort kmeans lavaMD leukocyte lud mummergpu myocyte nn nw particlefilter pathfinder srad streamcluster"

RODINIA_BIN_PATH=${RODINIA_PATH}/bin/linux/cuda

echo "****************************************"
echo " Compiling..."
echo "****************************************"
for i in ${RODINIA_APP}; do
	echo ""
	echo ""
	echo "****************************************"
	echo " ${i}"
	echo "****************************************"
	(cd ${RODINIA_APP_PATH}/${i} && make)
done

RODINIA_APP2="b+tree dwt2d gaussian heartwall hotspot3D huffman hybridsort lavaMD myocyte nn pathfinder"
for i in ${RODINIA_APP2}; do
	cp ${RODINIA_APP_PATH}/${i}/${i} ${RODINIA_BIN_PATH}/.
done

cp ${RODINIA_APP_PATH}/leukocyte/CUDA/leukocyte ${RODINIA_BIN_PATH}
cp ${RODINIA_APP_PATH}/lud/cuda/lud_cuda ${RODINIA_BIN_PATH}/lud
cp ${RODINIA_APP_PATH}/srad/srad_v1/srad_v1 ${RODINIA_BIN_PATH}
cp ${RODINIA_APP_PATH}/srad/srad_v2/srad_v2 ${RODINIA_BIN_PATH}
cp ${RODINIA_APP_PATH}/mummergpu/bin/mummergpu ${RODINIA_BIN_PATH}
cp ${RODINIA_APP_PATH}/particlefilter/particlefilter_float ${RODINIA_BIN_PATH}
cp ${RODINIA_APP_PATH}/particlefilter/particlefilter_naive ${RODINIA_BIN_PATH}
