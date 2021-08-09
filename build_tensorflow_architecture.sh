#!/bin/bash

## run this in the singularity container. 
 # chmod u+x build_tensorflow_architecture.sh
 #screen -S build
 #export tensorflowversion=2.5
 #export march='cascadelake'
 #export mtune='cascadelake'
 #export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
 #singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_architecture.sh
 #note the singularity shell will try to inherit your current wd
 #singularity containers aren't writable
 #singularity containers mount your home directory by default

## the following variables need to be defined (note that singularity containers inherit exported variables)
 #export tensorflowversion=
 #export march=
 #export mtune=
 

if [ -z "$bazel_output_base" ]
then
      exit 1
fi

if [ -z "$tensorflowversion" ]
then
      exit 1
fi


if [ -z "$march" ]; then
      exit 1
fi

if [ -z "$mtune" ]; then
      exit 1
fi



#download tensorflow source
mkdir -p builds
cd builds
mkdir tensorflow$march$mtune
cd tensorflow$march$mtune

git clone https://github.com/tensorflow/tensorflow tensorflow
cd tensorflow
git checkout tags/$tensorflowversion


## build and make wheel
bazel --output_base $bazel_output_base build --config=mkl \
 --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt="-march=${march}" \
 --copt="-mtune=${mtune}" --copt="-O3" \
  //tensorflow/tools/pip_package:build_pip_package && bazel-bin/tensorflow/tools/pip_package/build_pip_package ../
