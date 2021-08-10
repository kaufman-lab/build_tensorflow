#!/bin/bash

export tensorflowversion=v2.5.0 #must be a valid tag


export opt='mkl_only'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='nothing'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='O3_only'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='AVX2_only'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='mkl_AVX2_only'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='mkl_O3_only'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh

export opt='nothingOs'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommended
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_instructionsets.sh


export march='cascadelake'
export mtune='cascadelake'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommende
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_architecture.sh


export march='skylake'
export mtune='skylake'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommende
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_architecture.sh


export march='skylake-avx512'
export mtune='skylake-avx512'
export bazel_output_base=$(mktemp -d -t -p /scratch/builds) #this avoids using NFS on ~ which is not recommende
singularity exec --bind /scratch oras://ghcr.io/kaufman-lab/tensorflow_buildenvironment:v1 ./build_tensorflow_architecture.sh
