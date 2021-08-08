#!/bin/bash

## run this in the singularity container. 
 #note the singularity shell will try to inherit your current wd
 #singularity containers aren't writable
 #singularity containers mount your home directory by default

## the following variables need to be defined (note that singularity containers inherit exported variables)
 #export tensorflow-version=
 #export march=
 #export mtune=
 


#if[$march -ne 'cascadelake'] ||  ([$mtune == 'cascadelake'] && [march == 'cascadelake']); then

#download tensorflow source
git clone https://github.com/tensorflow/tensorflow
mv tensorflow tensorflow$march$mtune
git checkout r$tensorflow-version

bazel build --config=mkl --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" --copt="-march=${{ march }}" --copt="-mtune=${{ mtune }}" --copt="-O3" //tensorflow/tools/pip_package:build_pip_package

#build wheel
#bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_wheel
