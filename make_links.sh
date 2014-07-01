#!/bin/baseh
# ****************************************
#  Script for making environment for GPU-benches
#	Gunjae Koo (gunjae.koo@gmail.com)
# ****************************************

if [ -f common ]; then
	ln -s ~/bin/NVIDIA_GPU_Computing_SDK4/C/common common
fi

if [ -f sdkr ]; then
	ln -s ~/bin/NVIDIA_GPU_Computing_SDK4/C sdk4
fi

if [ -d Mars/bin ]; then
	mkdir Mars/bin
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/InvertedIndex/InvertedIndex InvertedIndex)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/Kmeans/Kmeans Kmeans)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/MatrixMul/MatrixMul MatrixMul)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/PageViewCount/PageViewCount PageViewCount)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/PageViewRank/PageViewRank PageViewRank)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/SimilarityScore/SimilarityScore SimilarityScore)
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/StringMatch/StringMatch StringMatch )
	(cd Mars/bin && ln -s ../../sdk4/bin/linux/release/WordCount/WordCount WordCount)
fi
