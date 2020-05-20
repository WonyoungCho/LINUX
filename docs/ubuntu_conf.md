# Ubuntu in Windows 10

## Package server to daum

```sh
$ cat /etc/apt/sources.list
$ sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
```

## Warning Emacs during compilation

```
$ mpiexec -np 4 ./hello.out
--------------------------------------------------------------------------
WARNING: Linux kernel CMA support was requested via the
btl_vader_single_copy_mechanism MCA variable, but CMA support is
not available due to restrictive ptrace settings.

The vader shared memory BTL will fall back on another single-copy
mechanism if one is available. This may result in lower performance.

  Local host: user_name
--------------------------------------------------------------------------
 Hello World!
 Hello World!
 Hello World!
 Hello World!
```


```sh
& echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
```


# Having problem with display, tk
```
sudo apt install python3-tk
sudo apt install imagemagick # open an image file
```

# Graphical applications
```
echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
sudo apt-get install x11-apps
```

# Emacs latest
```
$ sudo add-apt-repository ppa:kelleyk/emacs
$ sudo apt-get update
$ sudo apt-get install emacs26
```

# Desktop
```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt install ubuntu-desktop

$ sudo apt install xfce4 gnome-terminal
$ xfce4-session
```

# Python3
```
$ sudo apt install python3
$ sudo apt install python3-pip
```

If error message is shown like below duing installing pip package,
```
Traceback (most recent call last):
  File "/usr/bin/pip3", line 9, in <module>
    from pip import main
ImportError: cannot import name 'main'
```
```
$ sudo python3 -m pip uninstall pip && sudo apt-get install python3-pip --reinstall
```
