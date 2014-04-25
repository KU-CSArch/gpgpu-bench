*******************************************
 Environment for GPGPU benchmarks
 	by Gunjae Koo (gunjae.koo@gmail.com)
*******************************************

0. common
 - make a static link common -> /home/gunjae/bin/NVIDIA_GPU_Computing_SDK4/C/common

1. ispass2009
 - a benchmark bundle in gppgu-sim
 - copy ispass2009-benchmark to gpgpu-bench
 - rename ispass2009-benchmark to ispass2009
 - in the ispass2009 folder, run Makefile.ispass-2009
   + make -f Makefile.ispass-2009
 - some benchmarks aren't compiled
   + AES, DG, DG/3rdParty in hahoe.usc.edu
   + DG, DG/3rdParty in everest.usc.edu
 - binary files will be generated in ./bin/

2. rodinia_2.4
 - get rodinia benchmark suites (287M)
   + wget http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_2.4.tar.bz2
 - extract compressed file
   + tar -xvjf rodinia_2.4.tar.bz2
 - set NVIDIA SDK path in ./common/make.config
   + SDK_DIR = ~/bin/NVIDIA_GPU_Computing_SDK4/C
 - compile benchmarks
   + make CUDA
 - some benchmarks aren't compiled
   + cfd, srad_v2, mummergpu in hahoe.usc.edu
   + cfd, lavaMD, srad_v2, mummergpu in everest.usc.edu
 - bindary files will be generated in ./bin/

3. SDK
 - get NVDIA CUDA SDK
   + wget http://developer.download.nvidia.com/compute/cuda/4_2/rel/sdk/gpucomputingsdk_4.2.9_linux.run
 - run downloaded SDK files to ~/bin/NVIDIA_GPU_Computing_SDK4
   + chmod 755 *.run
   + gpucomputingsdk_4.2.9_linux.run
 - compile benchmarks
   + cd ~/bin/NVIDIA_GPU_Computing_SDK4/C
   + make
 - binary files will be generated in ./bin/linux/cuda/release

4. parboil
 - get parboil benchmark suites
   + from http://impact.crhc.illinois.edu/Parboil/parboil_download_page.aspx
 - extract the compressed driver file
   + tar -xvzf pb2.5driver.tgz
 - move benchmarks and data into the prboil folder and extract them
   + mv *.tgz ./parboil/.
   + cd parboil
   + tar -xvzf pb2.5benchmarks.tgz
   + tar -xvzf pb2.5datasets_standard.tgz
 - change permissions
   + chmod u+x ./parboil
   + chmod u+x benchmarks/*/tools/compare-output
 - copy example makefile.conf and set CUDA environment
   + cp Makefile.conf.example-nvidia Makefile.conf
 - set CUDA path in ./common/mk and ./common/platform
 - compile benchmarks in parboil root path. you can find benchmarks list
   + ./parboil list
   + ./parboil compile bfs cuda
