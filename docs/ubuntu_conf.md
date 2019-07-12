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

