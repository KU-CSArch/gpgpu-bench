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

## Docker image (Ubuntu 14.04) maybe SM=20
LIST="${LIST} segmentationTreeThrust MonteCarlo Interval simpleAtomicIntrinsics simpleVoteIntrinsics simplePrintf threadFenceReduction binomialOptions MonteCarloMultiGPU Mandelbrot quasirandomGenerator"

echo "${LIST}"
mkdir src_failed

for i in ${LIST}; do
	echo "mv src/${i} ./src_failed/."
	mv src/${i} ./src_failed/.
done

echo "done..."
