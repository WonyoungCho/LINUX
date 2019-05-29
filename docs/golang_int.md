# Introduction

## Install Golang on CentOS
<https://golang.org/dl/>
```
$ wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
$ sudo tar -xvzf go1.12.5.linux-amd64.tar.gz -C /usr/local
$ emacs /etc/profile.d/path.sh
export PATH=$PATH:/usr/local/go/bin

$ emacs /home/ycho/.bash_profile
export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
```

## Execution
```
$ go run hello.go
    or
$ go build hello.go
    or
$ go install hello.go
```
