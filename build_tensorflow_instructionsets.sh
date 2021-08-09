#!/bin/bash

## run this in the singularity container. 
 #chmod u+x build_tensorflow_instructionsets.sh
 #screen -S build
 #export tensorflowversion=2.5
 #export opt='mkl_only'
 #export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
 #singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh
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



if [ -z "$opt" ]
then
      exit 1
fi


#download tensorflow source
mkdir -p builds
cd builds
mkdir tensorflow$opt
cd tensorflow$opt

git clone https://github.com/tensorflow/tensorflow tensorflow
cd tensorflow
git checkout r$tensorflowversion


## build and make wheel

if [ "$opt" = "mkl_only" ]; then     
    bazel build --config=mkl -c opt --copt=-mno-avx512f --copt=-mno-avx2 --copt=-mno-fma \
    //tensorflow/tools/pip_package:build_pip_package && bazel-bin/tensorflow/tools/pip_package/build_pip_package ../
elif [ "$opt" = "nothing" ]; then
    bazel build -c opt --copt=-mno-avx512f --copt=-mno-avx2 --copt=-mno-fma \
    //tensorflow/tools/pip_package:build_pip_package && bazel-bin/tensorflow/tools/pip_package/build_pip_package ../
elif [ "$opt" = "O3_only" ]; then
    bazel build -c opt --copt=-mno-avx512f --copt=-mno-avx2 --copt=-mno-fma --copt="-O3" \
    //tensorflow/tools/pip_package:build_pip_package && bazel-bin/tensorflow/tools/pip_package/build_pip_package ../
else
  exit 1
fi

