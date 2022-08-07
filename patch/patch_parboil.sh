#!/bin/bash
# *******************************
# Patch for Parboil
# - Gunjae Koo (gunjae.koo@gmail.com)
# *******************************

source ../common.config

cp -i parboil/Makefile.conf ${PARBOIL_PATH}/common/.
cp -i parboil/compile_parboil.sh ${PARBOIL_PATH}/.

mkdir -p ${PARBOIL_PATH}/bin
