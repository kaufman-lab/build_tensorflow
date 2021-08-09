# tensorflow_builds

Intel CPU binaries for tensorflow 2.5

Build tensorflow for intel cpus (specifically skylake-avx512/cascadelake). Why not just use the pre-compiled binaries (https://pypi.org/project/intel-tensorflow-avx512/)?  They don't work with horovod (https://github.com/horovod/horovod/issues/3091). 

Code is based on https://software.intel.com/content/www/us/en/develop/articles/intel-optimization-for-tensorflow-installation-guide.html

Why go through this effort? My initial testing with intel-tensorflow-avx512 showed it was twice as fast as vanilla tensorflow (on a single node not using horovod).

This repo contains:

- code to build a container that can then be used to build tensorflow (as a github action workflow)
- package repository for that container (see right)
- code to build tensorflow in the container
- releases containing tensorflow binaries (forthcoming)


Note these binaries are built with `numpy==1.21.1` and definitely will not work with numpy 1.19. Here are all three python packages used to build tensorflow: it's probably a good idea to match all three of these exactly.
```
Keras-Preprocessing==1.1.2
numpy==1.21.1
six==1.16.0
```
