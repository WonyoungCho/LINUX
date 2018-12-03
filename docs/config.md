# Bashrc

```sh
$ emacs ~/.bashrc
```
```bash
# alias for convenience
alias l='ls'
alias em='emacs -nw'
alias edt='emacs -nw ~/.bashrc'

alias f='gfortran -o a'
alias fp='gfortran -fopenmp -o d'
alias m='mpif90 -o a'
alias mp='mpif90 -fopenmp -o a'

# Cluster alias
alias sq='squeue'
alias log='sudo sacct -n -X -o User%12,Start,End,Elapsed,AllocNodes,AllocCPUs,State -S 2018-11-23T12:00 -E 2018-11-23T18:00'

# GCC link
source scl_source enable devtoolset-7
```

# CentOS 7

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
```

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
