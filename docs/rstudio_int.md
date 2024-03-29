# Introduction

> <https://cran.r-project.org/>
> 
> <https://www.rstudio.com/products/rstudio/download-server/>


```bash
$ sudo apt install -y gcc-7 g++-7 gfortran liblzma-dev libblas-dev libreadline-dev xorg-dev libpcre2-dev dirmngr libcurl4-openssl-dev libbz2-dev openjdk-8-jdk
```

## Install R-Studio

- Connect to R Homepage.

> <https://cran.r-project.org/>

- Download R-4.1.2.tar.gz file.

> <https://cran.r-project.org/src/base/R-4/R-4.1.2.tar.gz>

- Unzip the R file to a folder.
```
$ tar -zxvf R-4.1.2.tar.gz -C /home/ycho/R
```

- Install.
```
$ cd /home/ycho/R/R-4.1.2
$ ./configure  --enable-R-shlib
$ make
```

- Execution.
```
$ cd /home/ycho/R/R-4.1.2/bin
$ ./R
```

## Mirror
- <https://cran.r-project.org/mirrors.html>

```bash
$ vi .Rprofile
local({
  r <- getOption("repos")
  r["CRAN"] <- "http://healthstat.snu.ac.kr/CRAN/"
  options(repos = r)
})
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
www-address=0.0.0.0 # it is a pc ip address which the R-server is installed.
rsession-which-r=/home/ycho/R/R-4.1.1/bin/R

$ sudo emacs /etc/rstudio/rsession.conf
www-port=8787
```

- Verification.
```
$ sudo rstudio-server stop
$ sudo rstudio-server verify-installation
```

- Open R-studio.

> Open web browser - Connect to http://localhost:8787 - Log in with pc ID and PASSWORD.
