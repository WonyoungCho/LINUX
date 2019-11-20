# sinfo
```
$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
all*         up   infinite      2   idle g-[11-12]

$ sinfo -s
PARTITION AVAIL  TIMELIMIT   NODES(A/I/O/T)  NODELIST
all*         up   infinite          0/2/0/2  g-[11-12]


```

# srun
```
$ srun --nodes 2 -l uname
0: g-11
1: g-12
```
