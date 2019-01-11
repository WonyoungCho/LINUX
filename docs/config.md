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
$ sudo emacs /etc/selinux/config
SELINUX=disabled
```

## Add a disk
```
$ sudo fdisk -l
```
추가된 디스크 확인 ex) /dev/sda

```
$ sudo fdisk /dev/sda
WARNING: fdisk GPT support is currently new, and therefore in an experimental phase. Use at your own discretion.
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): m
Command action
   d   delete a partition
   g   create a new empty GPT partition table
   G   create an IRIX (SGI) partition table
   l   list known partition types
   m   print this menu
   n   add a new partition
   o   create a new empty DOS partition table
   p   print the partition table
   q   quit without saving changes
   s   create a new empty Sun disklabel
   t   change a partition's system id
   v   verify the partition table
   w   write table to disk and exit
   x   extra functionality (experts only)

Command (m for help):
```

```
$ sudo mkfs -t ext4 /dev/sda
$ mkdir ~/share
$ chmod 777 /share
$ mount /dev/sda /share
$ mount 
```
위와 같이 mount하고 재부팅하면 mount가 풀린다. 부팅될때 mount 해주려면 `/dev/sda`의 `UUID`를 설정해 주어야 한다.

```
$ sudo blkid    # UUID 확인
$ sudo emacs /etc/fstab
UUID=UUID /dev/sda ext4 defaults 0 0
```
