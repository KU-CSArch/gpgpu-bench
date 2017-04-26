#!/bin/bash
# *******************************************
# Patch for GPGPU-Sim bundle benchmarks
# - Gunjae Koo (gunjae.koo@gmail.com)
# - reference from http://cs.stanford.edu/~kaichun/resume/projects/gpgpu.pdf
# *******************************************

source ../common.config

# pre-installed GCC version
CC_OLD_VER=4.6

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

echo "**********************************************"
echo " gfortran-4.4 installation"
echo "**********************************************"
confirm "gfortran-4.4" && \
	sudo apt-get install gfortran && \
	sudo apt-get install gfortran-4.4 && \
	sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-4.4 10 && \
	sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-${CC_OLD_VER} 20 && \
	sudo update-alternatives --install /usr/bin/fortran fortran /usr/bin/gfortran 30 && \
	sudo update-alternatives --set fortran /usr/bin/gfortran && \
	sudo update-alternatives --config gfortran

echo "**********************************************"
echo " Install openmpi"
echo "**********************************************"
confirm "openmpi" && \
	sudo apt-get install openmpi-bin libopenmpi-dev

echo "**********************************************"
echo " Install libboost"
echo "**********************************************"
confirm "libboost" && \
	sudo apt-get install libboost-system-dev libboost-filesystem-dev binutils-gold

echo "**********************************************"
echo " Install dependencies"
echo "**********************************************"
confirm "m4 zlib" && \
	sudo apt-get install m4 zlib1g-dev

echo "**********************************************"
echo " Replace makefiles"
echo "**********************************************"
echo "cp -i ispass2009/Makefile.ispass-2009 ${ISPASS_PATH}/Makefile.ispass-2009"
cp -i ispass2009/Makefile.ispass-2009 ${ISPASS_PATH}/Makefile.ispass-2009
echo "cp -i ispass2009/Makefile.AES ${ISPASS_PATH}/AES/Makefile"
cp -i ispass2009/Makefile.AES ${ISPASS_PATH}/AES/Makefile
echo "cp -i ispass2009/Makefile.DG ${ISPASS_PATH}/DG/Makefile"
cp -i ispass2009/Makefile.DG ${ISPASS_PATH}/DG/Makefile
echo "cp -i ispass2009/Makefile.in.DG_3rdParty ${ISPASS_PATH}/DG/3rdParty/ParMetis-3.1/Makefile.in"
cp -i ispass2009/Makefile.in.DG_3rdParty ${ISPASS_PATH}/DG/3rdParty/ParMetis-3.1/Makefile.in
echo "cp -i ispass2009/Makefile.WP ${ISPASS_PATH}/WP/makefile"
cp -i ispass2009/Makefile.WP ${ISPASS_PATH}/WP/makefile

echo "---- done ----"
