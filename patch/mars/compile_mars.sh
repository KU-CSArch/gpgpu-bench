#!/bin/bash
# ********************************************
# Compiling MARS benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# ********************************************

source ../common.config

MARS_APP_PATH=sample_apps
MARS_APP="InvertedIndex Kmeans MatrixMul PageViewCount PageViewRank SimilarityScore StringMatch WordCount"

function make_links() {
	rm -f common
	rm -f lib
	rm -f ../shared
	
	ln -s ${CUDA_SDK_PATH}/C/common common
	ln -s ${CUDA_SDK_PATH}/C/lib lib
	ln -s ${CUDA_SDK_PATH}/shared ../shared
}

echo "********************************"
echo " Making links"
echo "********************************"
make_links

echo "********************************"
echo " Cleaning"
echo "********************************"
rm -rf bin
for i in ${MARS_APP}; do
	(cd ${MARS_APP_PATH}/${i} && rm -rf obj)
	(cd ${MARS_APP_PATH}/${i} && make clean)
done


echo "********************************"
echo " Compiling"
echo "********************************"
(cd ${CUDA_SDK_PATH} && make)
for i in ${MARS_APP}; do
	echo ""
	echo ""
	echo "********************************"
	echo "${i}"
	echo "********************************"
	make_links
	(cd ${MARS_APP_PATH}/${i} && make)
done

echo "--- done ---"
