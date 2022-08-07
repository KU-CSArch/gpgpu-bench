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
	wget https://github.com/gpgpu-sim/ispass2009-benchmarks/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv ispass2009-benchmarks-master ispass2009 && \
	rm -f master.zip
	#git clone https://github.com/gpgpu-sim/ispass2009-benchmarks.git && \
	#mv ispass2009-benchmarks ispass2009 && \
	#(cd ispass2009 && rm -rf .git)
#	(cd ispass2009 && make -f Makefile.ispass-2009)

echo "**********************************************"
echo " Rodinia"
echo "**********************************************"
confirm "rodinia" && \
	wget http://filedn.com/luEeJVCCazShDlU4ibloXvu/class/rodinia.tar.bz2 && \
	#wget -O rodinia.tar.bz2 http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_3.1.tar.bz2 && \
	tar -xvjf rodinia.tar.bz2

echo "**********************************************"
echo " Mars"
echo "**********************************************"
confirm "mars" && \
	wget --no-check-certificate http://www.cse.ust.hk/catalac/users/wenbin/mars/Mars.zip && \
	unzip Mars.zip
#	cp -r Mars/sample_apps ~/bin/NVIDIA_GPU_Computing_SDK4/C

echo "**********************************************"
echo " Parboil (not supported)"
echo " - Need to download benchmarks and datasets from http://impact.crhc.illinois.edu/parboil/parboil.aspx"
echo "**********************************************"
confirm "Parboil" && \
	wget http://filedn.com/luEeJVCCazShDlU4ibloXvu/class/pb2.5driver.tgz && \
	wget http://filedn.com/luEeJVCCazShDlU4ibloXvu/class/pb2.5benchmarks.tgz && \
	wget http://filedn.com/luEeJVCCazShDlU4ibloXvu/class/pb2.5datasets_standard.tgz && \
	tar -xvzf pb2.5driver.tgz && \
	mv pb2.5*.tgz ./parboil/. && \
	(cd parboil && tar -xvzf pb2.5benchmarks.tgz) && \
	(cd parboil && tar -xvzf pb2.5datasets_standard.tgz) && \
	(cd parboil && chmod u+x parboil && chmod u+x benchmarks/*/tools/compare-output)
	#git clone https://github.com/abduld/Parboil.git && \
	#(cd Parboil && rm -rf .git)

echo "**********************************************"
echo " PolyBench"
echo "**********************************************"
confirm "PolyBench-ACC" && \
	wget https://github.com/cavazos-lab/PolyBench-ACC/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv PolyBench-ACC-master PolyBench-ACC && \
	rm -f master.zip
	#git clone https://github.com/cavazos-lab/PolyBench-ACC.git && \
	#(cd PolyBench-ACC && rm -rf .git)

echo "**********************************************"
echo " FinanceBench"
echo "**********************************************"
confirm "FinanceBench" && \
	wget https://github.com/cavazos-lab/FinanceBench/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv FinanceBench-master FinanceBench && \
	rm -f master.zip
	#git clone https://github.com/cavazos-lab/FinanceBench.git && \
	#(cd FinanceBench && rm -rf .git)

echo "**********************************************"
echo " SHOC"
echo "**********************************************"
confirm "SHOC" && \
	wget https://github.com/vetter/shoc/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv shoc-master shoc && \
	rm -f master.zip
	#git clone https://github.com/vetter/shoc.git && \
	#(cd shoc && rm -rf .git)

echo "**********************************************"
echo " Graph applications"
echo "**********************************************"
confirm "GraphBench" && \
	wget https://github.com/qiuminxu/GraphApplications/archive/refs/heads/master.zip && \
	unzip master.zip && \
	mv GraphApplications-master GraphBench && \
	rm -f master.zip
	#git clone https://github.com/qiuminxu/GraphApplications.git && \
	#mv GraphApplications GraphBench && \
	#(cd GraphBench && rm -rf .git)

echo "**********************************************"
echo " Tango (DNN applications)"
echo "**********************************************"
confirm "Tango" && \
	wget https://gitlab.com/Tango-DNNbench/Tango/-/archive/master/Tango-master.zip && \
	unzip Tango-master.zip && \
	mv Tango-master Tango && \
	rm -f Tango-master.zip
	#git clone https://gitlab.com/Tango-DNNbench/Tango.git && \
	#(cd Tango && rm -rf .git)
