# For Login server

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

# Bashrc
```
$ vi ~/.bashrc
alias edt='emacs -nw ~/.bashrc'
alias edm='emacs -nw ~/.tmux.conf'
alias em='emacs'

alias l='ls'
alias les='less -N'
alias tl='tmux ls'
alias t0='tmux attach -t 0'
alias t1='tmux attach -t 1'
alias t2='tmux attach -t 2'
alias t3='tmux attach -t 3'
alias t4='tmux attach -t 4'
alias t5='tmux attach -t 5'
alias t6='tmux attach -t 6'
alias t7='tmux attach -t 7'
alias t8='tmux attach -t 8'
alias t9='tmux attach -t 9'
alias du='du -h'
alias df='df -h'

export PATH="/home/ycho/emacs/bin:/home/ycho/htop-2.2.0/bin:/home/ycho/tmux-3.0a/bin:$PATH"

export LD_LIBRARY_PATH=/home/ycho/libevent/lib:$LD_LIBRARY_PATH
```

# tmux.conf
```
$ cd
$ wget https://raw.githubusercontent.com/WonyoungCho/LINUX/master/docs/.tmux.conf
```
```
unbind C-b
set-option -g prefix F10

set-window-option -g xterm-keys on
set -g default-terminal "xterm"

bind -n End send-key C-e
bind -n Home send-key C-a

set -g history-limit 50000

set -g base-index 1
setw -g pane-base-index 1

setw -g automatic-rename on
set -g renumber-windows on

set -g set-titles on

set -g display-panes-time 800
set -g display-time 1000

set -g status-interval 10

bind C-f command-prompt -p find-session 'switch-client -t %%'

bind v split-window -v
bind h split-window -h
bind Tab last-window
bind-key y set-window-option synchronize-panes

bind a run "cut -c3- ~/.tmux.conf | sh -s _toggle_mouse"

run 'cut -c3- ~/.tmux.conf | sh -s _apply_configuration'

bind-key -n MouseDown3Pane run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer; tmux display-message 'pasted!'"
```
