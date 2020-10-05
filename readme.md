# Benchmark suites for GPGPU-Sim

This repository includes several benchmark suites that can be simulated using GPGPU-Sim.  These benchmarks are tested using GPGPU-Sim 3.2.2 on Ubuntu 14.04 and the compatible Linux distros (such as LinuxMint 17).

## Installation

1. Run **get_cuda.sh** to install *NVIDIA CUDA* and *CUDA SDK*. This script will execute the patch for CUDA SDK automatically. Use the default target directory (/usr/local/cuda) for CUDA. You can set any target directories for CUDA SDK, but the all scripts in this repository assume CUDA SDK is installed in *~/workspace/cuda_sdk4*.

   ```
   $ ./get_cuda.sh 
   ```

2. Install **CUDA SDK**. Move to the source directory (~/workspace/cuda_sdk4/C) and run *cuda_sdk_fail.sh* which will move the sources that cannot be compiled to *src_failed* folder. Then compile *CUDA SDK* by executing *make*.

   ```
   $ cd ~/workspace/cuda_sdk4/C
   $ ./cuda_sdk_fail.sh
   $ make
   ```

3. Run **get_benchmarks.sh** to download the source files of the benchmark suites. You can select the benchmark suites that you want to install.

   ```
   $ cd ~/workspace/gpgpu-bench
   $ ./get_benchmarks.sh
   ```

4. Run **patches** for the downloaded benchmark suites. The patches will copy the modified compilation scripts. The following code exhibits how to run the patch for GPGPU-Sim bundle benchmarks.

   ```
   $ cd patch
   $ ./patch_ispass2009.sh
   ```

5. Now, you are ready to compile the benchmark suites.



## Compilation

0. **CUDA SDK:** already compiled while installing *CUDA SDK*.

1. **GPGPU-Sim bundle**

   ```
   $ cd ispass2009
   $ make -f Makefile.ispass-2009
   ```

2. **Rodinia 3.1**

   ```
   $ cd rodinia_3.1
   $ ./compile_rodinia.sh
   $ ./compile_rodinia_nvidia.sh
   ```

3. **Mars**

   ```
   $ cd Mars
   $ ./compile_mars.sh
   ```

4. **PolyBench**

   ```
   $ cd PolyBench-ACC
   $ ./compile_cuda.sh
   ```

5. **SHOC**

   ```
   $ cd shoc
   $ ./configure
   $ ./make
   $ ./make install
   ```

For other benchmark suites, refer *readme.txt*

------

