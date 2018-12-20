# Bashrc

```sh
$ emacs ~/.bashrc
```
```bash
~/dropbox.py start

# alias for convenience
alias l='ls'
alias em='emacs -nw'
alias edt='emacs -nw ~/.bashrc'

alias f='gfortran -o a'
alias fp='gfortran -fopenmp -o d'
alias m='mpif90 -o a'
alias mp='mpif90 -fopenmp -o a'
alias nv='nvcc -arch=sm_70 -o a'

# Cluster alias
alias sq='squeue'
alias log='sudo sacct -n -X -o User%12,Start,End,Elapsed,AllocNodes,AllocCPUs,State -S 2018-11-23T12:00 -E 2018-11-23T18:00'

# GCC link
source scl_source enable devtoolset-7
```

# CentOS 7
## GCC 7.3.0
```sh
$ sudo yum install centos-release-scl
$ sudo yum install devtoolset-7
$ sudo yum install devtoolset-7-gcc-7.3.0
```

## xrdp
```sh
$ yum install epel-release -y
$ yum install xrdp --enablerepo=cr
$ yum -y install tigervnc-server
```
REBOOT!

```sh
$ systemctl start xrdp.service
$ netstat -antup | grep xrdp
 
$ systemctl enable xrdp.service
  
$ firewall-cmd --permanent --zone=public --add-port=3389/tcp
$ firewall-cmd --reload
$ sudo emacs -nw /etc/xrdp/xrdp.ini
```

## CUDA

- <https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-centos-7-linux>
- <https://linuxconfig.org/how-to-install-nvidia-cuda-toolkit-on-centos-7-linux>

## hostname
```sh
hostnamectl set-hostname name
```

## Dropbox
Change the default web browser konqueror to other.
```sh
$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
```
```sh
$ emacs dropboxcheat.c
```
```c
const char *gnu_get_libc_version (void)
{
        return "2.19";
}
```
```sh
$ gcc -Wall -fPIC -shared -o dropboxcheat.so dropboxcheat.c
$ sudo mv dropboxcheat.so /usr/local/lib64/
$ sudo LD_PRELOAD=/usr/local/lib64/dropboxcheat.so ~/.dropbox-dist/dropboxd
```
- **Dropbox CLI**
```sh
$ cd ~
$ curl -LO https://www.dropbox.com/download?dl=packages/dropbox.py
$ chmod +x ~/dropbox.py
$ ln -s /opt/dropbox ~/.dropbox-dist
$ ~/dropbox.py
$ ~/dropbox.py status
$ sudo service dropbox start
```

## Chrome
```sh
$ sudo emacs /etc/yum.repos.d/google-chrome.repo
```
```sh
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
```
```sh
$ yum install google-chrome-stable
```

## Cadabra2

<a href="https://github.com/kpeeters/cadabra2" target="_blank"> https://github.com/kpeeters/cadabra2 </a>

## Install Module System
```sh
yum install environment-modules -y
```

## Samba
```bash
$ sudo yum install samba
$ sudo smbpasswd -a user_ID
$ sudo firewall-cmd --permanent --zone=public --add-service=samba
$ sudo firewall-cmd --reload
$ sudo emacs /etc/selinux/config
SELINUX=disabled
$ sudo service smb restart
$ sudo systemctl satart smb
$ sudo systemctl enable smb
$ sudo reboot now
```
```bash
$ sudo emacs /etc/samba/smb.conf
```
