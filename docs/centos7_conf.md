# Install R-Studio

1. Connect to R Homepage
https://cran.r-project.org/

1. Download R-3.6.0.tar.gz
https://cran.r-project.org/src/base/R-3/R-3.6.0.tar.gz

1. Unzip the R file to a folder.
```
$ tar -zxvf R-3.6.0.tar.gz -C /home/ycho/R
```

4. Configuration.
```
$ cd /home/ycho/R/R-3.6.0
$ ./configure  --enable-R-shlib --with-readline=no --with-x=no
$ make
```

5. 
