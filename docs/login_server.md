# For Log-in server

# Emacs
```
$ wget https://ftp.gnu.org/gnu/emacs/emacs-26.3.tar.gz
$ tar -zxvf emacs-26.3.tar.gz
$ cd emacs-26.3
$ ./configure --prefix=/home/ycho/emacs --without-x --with-gnutls=no
$ make & make install
```

# htop
```
$ wget https://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
$ tar -zxvf htop-2.2.0.tar.gz
$ cd htop-2.2.0
$ ./configure --prefix=/home/ycho/htop-2.0.2
$ make && make install
```

# Libevent
```
$ wget https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
$ mkdir libevent
$ tar -zxvf libevent-2.1.11-stable.tar.gz
$ cd libevent-2.1.11-stable
$ ./configure --prefix=/home/ycho/libevent
$ make && make install
```

# Tmux
```
$ wget https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
$ tar -zxvf tmux-3.0a.tar.gz
$ cd tmux-3.0a
$ DIR="$HOME/libevent"
$ ./configure --prefix=/home/ycho/tmux-3.0a CFLAGS="-I$DIR/include" LDFLAGS="-L$DIR/lib"
$ make && make install
```
