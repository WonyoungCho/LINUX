# Instroduction

> <https://cran.r-project.org/>
> 
> <https://www.rstudio.com/products/rstudio/download-server/>


## Install R-Studio

- Connect to R Homepage.

> <https://cran.r-project.org/>

- Download R-3.6.0.tar.gz file.

> <https://cran.r-project.org/src/base/R-3/R-3.6.0.tar.gz>

- Unzip the R file to a folder.
```
$ tar -zxvf R-3.6.0.tar.gz -C /home/ycho/R
```

- Install.
```
$ cd /home/ycho/R/R-3.6.0
$ ./configure  --enable-R-shlib --with-readline=no --with-x=no
$ make
```

- Execution.
```
$ cd /home/ycho/R/R-3.6.0/bin
$ ./R
```


## Install R-Studio Server

- Connect to R-Stuio Homepage.

> <https://www.rstudio.com/products/rstudio/download/>

- Download & Install R-Stuio Server.

> <https://www.rstudio.com/products/rstudio/download-server/>
```
$ wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.1335-x86_64.rpm
$ sudo yum install rstudio-server-rhel-1.2.1335-x86_64.rpm
```

- Configuration.
```
$ sudo emacs /etc/rstudio/rserver.conf
www-port=8787
www-address=192.168.0.1 # it is a pc ip address which the R-server is installed.
rsession-which-r=/home/ycho/R/R-3.6.0/bin/R

$ sudo emacs /etc/rstudio/rsession.conf
www-port=8787
```

- Verification.
```
$ rstudio-server verify-installation
```

- Open R-studio.

> Open web browser - Connect to http://192.168.0.1:8787 - Log in with pc ID and PASSWORD.
