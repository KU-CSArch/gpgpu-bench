#!/bin/bash
# ***************************************
#  Excluding benchmarks that encounter compilation fails
# ***************************************

## Ubuntu 14.04
LIST=""
LIST="${LIST} deviceQueryDrv"
LIST="${LIST} matrixMulDrv"
LIST="${LIST} vectorAddDrv"
LIST="${LIST} threadMigration"
LIST="${LIST} ptxjit"
LIST="${LIST} deviceQuery"
LIST="${LIST} simpleTextureDrv"

echo "${LIST}"
mkdir src_failed

for i in ${LIST}; do
	echo "mv src/${i} ./src_failed/."
	mv src/${i} ./src_failed/.
done

echo "done..."
