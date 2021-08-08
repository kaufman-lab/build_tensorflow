#!/bin/bash

## run this in the singularity container. 
 #chmod u+x build_tensorflow.sh
 #screen -S build
 #export tensorflowversion=2.5
 #export march='cascadelake'
 #export mtune='cascadelake'
 #singularity exec oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow.sh
 #note the singularity shell will try to inherit your current wd
 #singularity containers aren't writable
 #singularity containers mount your home directory by default

## the following variables need to be defined (note that singularity containers inherit exported variables)
 #export tensorflowversion=
 #export march=
 #export mtune=
 


#if[$march -ne 'cascadelake'] ||  ([$mtune == 'cascadelake'] && [march == 'cascadelake']); then

#download tensorflow source
git clone https://github.com/tensorflow/tensorflow tensorflow$march$mtune
cd tensorflow$march$mtune

bazel build --config=mkl --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt="-march=${march}" --copt="-mtune=${mtune}" --copt="-O3" //tensorflow/tools/pip_package:build_pip_package

#build wheel
#bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_wheel
