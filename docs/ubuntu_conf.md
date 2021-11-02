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

# WSL2 ssh
```
$ sudo apt install openssh-server
$ sudo ssh-keygen -A
$ sudo service ssh start
$ sudo vi /etc/ssh/sshd_config
PermitRootLogin yes
PasswordAuthentication yes
$ sudo service ssh restart
$ netstat -an
```

```
$ PowerShell.exe -ExecutionPolicy Bypass -File .\external.ps1
```

external.ps1

```
$remoteport = bash.exe -c "ifconfig eth0 | grep 'inet '"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if( $found ){
  $remoteport = $matches[0];
} else{
  echo "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}

#[Ports]

#All the ports you want to forward separated by coma
$ports=@(8501);


#[Static ip]
#You can change the addr to your ip config to listen to a specific address
$addr='0.0.0.0';
$ports_a = $ports -join ",";


#Remove Firewall Exception Rules
iex "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";

#adding Exception Rules for inbound and outbound Rules
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP";
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -LocalPort $ports_a -Action Allow -Protocol TCP";

for( $i = 0; $i -lt $ports.length; $i++ ){
  $port = $ports[$i];
  iex "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr";
  iex "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteport";
}
```
