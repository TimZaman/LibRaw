#/bin/sh
if [[ "$OSTYPE" == "darwin"* ]]; then
	CC=clang2
	CXX=clang2++
	#CFLAGS=" -fopenmp "
	#CXXFLAGS=" -fopenmp "


	FOLDER_CLANGOMP="/Users/tzaman/clang-omp"
	#CPPFLAGS=${CPPFLAGS}" -I/opt/local/include "
	#CPPFLAGS=${CPPFLAGS}" -I/Library/Developer/CommandLineTools/usr/lib/c++/v1 "
	#CPPFLAGS=${CPPFLAGS}" -I/usr/local/include "
	#LDFLAGS=${LDFLAGS}" -I/opt/local/lib "
	#LDFLAGS=${LDFLAGS}" -L${FOLDER_CLANGOMP}/llvm/build/Debug+Asserts/lib "
	#LDFLAGS=${LDFLAGS}" -L/usr/local/lib "

	CPPFLAGS=${CPPFLAGS}" -I/opt/local/include "
	#CPPFLAGS=${CPPFLAGS}" -I/Library/Developer/CommandLineTools/usr/lib/c++/v1 "
	CPPFLAGS=${CPPFLAGS}" -I/Library/Developer/CommandLineTools/usr/include/c++/v1 "
	CPPFLAGS=${CPPFLAGS}" -I/usr/local/include "
	LDFLAGS=${LDFLAGS}" -I/opt/local/lib "
	LDFLAGS=${LDFLAGS}" -L${FOLDER_CLANGOMP}/llvm/build/Debug+Asserts/lib "
	LDFLAGS=${LDFLAGS}" -L/usr/local/lib "


	#-isystem /Library/Developer/CommandLineTools/usr/lib/c++/v1
	#/Library/Developer/CommandLineTools/usr/include/c++/v1


	export CC
	export CXX
	export CPPFLAGS
	export LDFLAGS
	export CFLAGS
	export CXXFLAGS

	#make clean
	#./configure --enable-demosaic-pack-gpl2 --enable-demosaic-pack-gpl3 --enable-openmp 
	#make
fi

rm -r _build
mkdir _build
cd _build
cmake -DENABLE_LCMS=1 -DENABLE_DEMOSAIC_PACK_GPL2=1 -DENABLE_DEMOSAIC_PACK_GPL3=1 -DENABLE_OPENMP=1  ..
make
sudo make install


fg_green="$(tput setaf 2)"
reset="$(tput sgr0)"
echo -e "${fg_green} You can now run 'sudo make install' ${reset}"


