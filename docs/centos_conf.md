# Python3
```
$ sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
$ sudo yum install -y python36 python36-libs python36-devel python36-pip
$ ls -l /bin/python*
$ sudo unlink /bin/python
$ sudo ln -s /bin/python3.6 /bin/python3
$ sudo ln -s /bin/python3.6 /bin/python
$ sudo ln -s /bin/pip3.6 /bin/pip

$ sudo emacs /bin/yum
$ sudo emacs /usr/libexec/urlgrabber-ext-down
```
exit and login again
```
$ sudo pip install numpy pandas matplolib scipy seaborn tqdm pandas_plink
```

# GCC 7
```
$ sudo yum install centos-release-scl
$ sudo yum install devtoolset-7

$ emacs ~/.bashrc
source scl_source enable devtoolset-7
```

# PyCuda
```
sudo pip install pycuda
```
# OpenMPI
```
$ wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.2.tar.gz
$ tar -xzf openmpi-*.tar.gz && cd openmpi-*
$ ./configure --with-cuda
$ make -j$(nproc) 
$ sudo make install
```

# MPI4Py
```
$ sudo pip install mpi4py
```

# Enviroment modules
```
$ sudo yum install environment-modules -y
```
