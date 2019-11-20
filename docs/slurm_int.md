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
$ srun --nodes=2 -l hostname
0: g-11
1: g-12

$ srun --nodes=2 --ntasks=10 -l hostname
0: g-11
6: g-12
1: g-11
7: g-12
2: g-11
3: g-11
4: g-11
8: g-12
9: g-12
5: g-11
```
