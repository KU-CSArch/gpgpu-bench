#!/bin/bash
# ******************************************************
#	Scripts for setup linux OS
#	 by Gunjae Koo (gunjae.koo@gmail.com)
# ******************************************************

# global variables
ITEM=""

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

#echo "**********************************************"
#echo " Make static link to common"
#echo " (CUDA SDK 4.X should be installed already!!)"
#echo " (~/bin/NVIDIA_GPU_Computing_SDK4/C/common common -> common)"
#echo "**********************************************"
#confirm "make_link" && \
#	ln -s ~/bin/NVIDIA_GPU_Computing_SDK4/C/common common

echo "**********************************************"
echo " GPGPU-Sim bundle"
echo "**********************************************"
confirm "GPGPU-Sim bundle" && \
	git clone https://github.com/gpgpu-sim/ispass2009-benchmarks.git && \
	mv ispass2009-benchmarks ispass2009 && \
	(cd ispass2009 && rm -rf .git)
#	(cd ispass2009 && make -f Makefile.ispass-2009)

echo "**********************************************"
echo " Rodinia"
echo "**********************************************"
confirm "rodinia" && \
	wget -O rodinia.tar.bz2 http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_3.1.tar.bz2 && \
	tar -xvjf rodinia.tar.bz2

echo "**********************************************"
echo " Mars"
echo "**********************************************"
confirm "mars" && \
	wget http://www.cse.ust.hk/catalac/users/wenbin/mars/Mars.zip && \
	unzip Mars.zip
#	cp -r Mars/sample_apps ~/bin/NVIDIA_GPU_Computing_SDK4/C

echo "**********************************************"
echo " PolyBench"
echo "**********************************************"
confirm "PolyBench-AAC" && \
	git clone https://github.com/cavazos-lab/PolyBench-ACC.git && \
	(cd PolyBench-ACC && rm -rf .git)

echo "**********************************************"
echo " FinanceBench"
echo "**********************************************"
confirm "FinanceBench" && \
	git clone https://github.com/cavazos-lab/FinanceBench.git && \
	(cd FinanceBench && rm -rf .git)

echo "**********************************************"
echo " SHOC"
echo "**********************************************"
confirm "SHOC" && \
	git clone https://github.com/vetter/shoc.git && \
	(cd shoc && rm -rf .git)

echo "**********************************************"
echo " Graph applications"
echo "**********************************************"
confirm "GraphBench" && \
	git clone https://github.com/lestrose/GraphApplications.git && \
	mv GraphApplications GraphBench && \
	(cd GraphBench && rm -rf .git)
