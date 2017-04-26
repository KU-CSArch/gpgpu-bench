#!/bin/bash
# *******************************************
# Patch for MARS benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# *******************************************

source ../common.config

MARS_APP_PATH=sample_apps
MARS_APP="InvertedIndex Kmeans MatrixMul PageViewCount PageViewRank SimilarityScore StringMatch WordCount"

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

echo "cp -i mars/compile_mars.sh ${MARS_PATH}/."
cp -i mars/compile_mars.sh ${MARS_PATH}/.

echo "**********************************************"
echo " Replace makefiles"
echo "**********************************************"
for i in ${MARS_APP}; do
	echo "cp -i mars/Makefile.${i} ${MARS_PATH}/${MARS_APP_PATH}/${i}/Makefile"
	cp -i mars/Makefile.${i} ${MARS_PATH}/${MARS_APP_PATH}/${i}/Makefile
done

echo "---- done ----"
