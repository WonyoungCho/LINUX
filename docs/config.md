# Bashrc - alias

```sh
$ emacs ~/.bashrc
```
```bash
# Alias for convenience
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
```

# xrdp - CentOS 7

```sh
$ yum install epel-release -y
$ yum install xrdp --enablerepo=cr
$ yum -y install tigervnc-server

  
$ systemctl start xrdp.service
$ netstat -antup | grep xrdp     # xrdp 가 동작하는지 확인
 
$ systemctl enable xrdp.service
  
$ firewall-cmd --permanent --zone=public --add-port=3389/tcp
$ firewall-cmd --reload
```
