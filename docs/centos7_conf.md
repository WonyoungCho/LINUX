# Install R-Studio

1. Connect to R Homepage
https://cran.r-project.org/

1. Download R-3.6.0.tar.gz
https://cran.r-project.org/src/base/R-3/R-3.6.0.tar.gz

1. Unzip the R file to a folder.
```
$ tar -zxvf R-3.6.0.tar.gz -C /home/ycho/R
```

4. Install.
```
$ cd /home/ycho/R/R-3.6.0
$ ./configure  --enable-R-shlib --with-readline=no --with-x=no
$ make
```

5. Execution.
```
$ cd /home/ycho/R/R-3.6.0/bin
$ ./R
```


# Install R-Studio Server

1. Connect to R-Stuio Homepage
https://www.rstudio.com/products/rstudio/download/

1. Download & Install R-Stuio Server
https://www.rstudio.com/products/rstudio/download-server/
```
$ wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.1335-x86_64.rpm
$ sudo yum install rstudio-server-rhel-1.2.1335-x86_64.rpm
```

3. Configuration.
```
$ sudo emacs /etc/rstudio/rserver.conf
www-port=8787
www-address=127.0.0.1 # default
rsession-which-r=/home/ycho/R/R-3.6.0/bin/R

$ sudo emacs /etc/rstudio/rsession.conf
www-port=8787
```

4. Verification
```
$ rstudio-server verify-installation
```
