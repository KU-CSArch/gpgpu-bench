#!/bin/bash
# *******************************************
# Patch for Rodinia benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# *******************************************

source ../common.config

RODINIA_APP_PATH=${RODINIA_PATH}/cuda
RODINIA_APP="backprop bfs b+tree cfd dwt2d gaussian heartwall hotspot hotspot3D huffman hybridsort kmeans lavaMD leukocyte lud mummergpu myocyte nn nw particlefilter pathfinder srad streamcluster"

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
echo " Installing CUDA libraries"
echo "**********************************************"
sudo apt-get install libcuda1-346 libcudart5.5

echo "cp -i rodinia/compile_rodinia*.sh ${RODINIA_PATH}/."
cp -i rodinia/compile_rodinia*.sh ${RODINIA_PATH}/.
cp -i rodinia/make.config ${RODINIA_PATH}/common/.

echo "**********************************************"
echo " Replace makefiles"
echo "**********************************************"
cp -i rodinia/Makefile.b+tree ${RODINIA_APP_PATH}/b+tree/Makefile
cp -i rodinia/Makefile.hotspot3D ${RODINIA_APP_PATH}/hotspot3D/Makefile
cp -i rodinia/Makefile.huffman ${RODINIA_APP_PATH}/huffman/Makefile
cp -i rodinia/Makefile.hybridsort ${RODINIA_APP_PATH}/hybridsort/Makefile
cp -i rodinia/Makefile.myocyte ${RODINIA_APP_PATH}/myocyte/Makefile
cp -i rodinia/Makefile.srad_v2 ${RODINIA_APP_PATH}/srad/srad_v2/Makefile
cp -i rodinia/makefile.lavaMD ${RODINIA_APP_PATH}/lavaMD/makefile
cp -i rodinia/makefile.srad_v1 ${RODINIA_APP_PATH}/srad/srad_v1/makefile

echo "---- done ----"
