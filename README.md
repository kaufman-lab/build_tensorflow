# tensorflow_builds

Intel CPU binaries for tensorflow 2.5

Build tensorflow for intel cpus (specifically skylake-avx512/cascadelake). Why not just use the pre-compiled binaries (https://pypi.org/project/intel-tensorflow-avx512/)?  They work inconsistently with horovod (https://github.com/horovod/horovod/issues/3091). 

Code is based on https://software.intel.com/content/www/us/en/develop/articles/intel-optimization-for-tensorflow-installation-guide.html

Why go through this effort? My initial testing with intel-tensorflow-avx512 showed it was twice as fast as vanilla tensorflow (on a single node not using horovod), but further testings showed when using multiple processes (ie multiple nodes) the intel version was actually slower than vanilla tensorflow.

This repo contains:

- code to build a container that can then be used to build tensorflow (as a github action workflow)
- package repository for that container (see right, under packages)
- code to build tensorflow in the container
- releases containing tensorflow binaries with tweaks to a bunch of different instruction sets (see right, under releases)


Here are all three python packages used to build tensorflow: it's probably a good idea to match all three of these exactly.
```
wheel==0.35
Keras-Preprocessing==1.1.2
numpy==1.19.2
six==1.15.0
```
