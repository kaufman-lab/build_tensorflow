# tensorflow_builds

Build tensorflow for intel cpus (specifically skylake-avx512/cascadelake). Why not just use the pre-compiled binaries (https://pypi.org/project/intel-tensorflow-avx512/)?  They don't work with horovod (https://github.com/horovod/horovod/issues/3091). 

Code is based on https://software.intel.com/content/www/us/en/develop/articles/intel-optimization-for-tensorflow-installation-guide.html

Why go through this effort? My initial testing with intel-tensorflow-avx512 showed it was twice as fast as vanilla tensorflow (on a single node not using horovod).

- code to build a container that can then be used to build tensorflow
- package repository for that container (see right)
- code to build tensorflow in the container
- releases containing tensorflow binaries (forthcoming)
