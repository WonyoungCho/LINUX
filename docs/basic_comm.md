# Basic command
- pdsh : run a command on multiple nodes in parallel
> - pdsh -w 'node_name'

---
**Ref** : <a href="https://linux.die.net/man/1/pdsh" target="_blank"> https://linux.die.net/man/1/pdsh </a>

## Read dataframe
```
$ f=filename.csv ; column -s, -t < ${f} | less -#2 -N -S
```

## Lines and columns
```
$ wc -l filename.csv # number of lines
$ awk -F',' '{print NF; exit}' filename.csv # number of columns
```

## Print file names
```
$ find ./  -printf "%f\n"
```

## Change file extension
```
$ rename "s/\.old$/.new/" *
```
```
$ for f in *.old; do mv -- "$f" "${f%.old}.new"; done
```

## Firewall
```
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-port=xxx/tcp --zone=public --permanent #--zone=dmz
sudo firewall-cmd --reload
```

## Running jobs
When we run same jobs, xargs is used.
```
$ cat bam2pro.txt
samtools view -b 1.bam|samtools mpileup -| sam2pro -c 6 > 1.bam.pro
samtools view -b 2.bam|samtools mpileup -| sam2pro -c 6 > 2.bam.pro
samtools view -b 3.bam|samtools mpileup -| sam2pro -c 6 > 3.bam.pro
samtools view -b 4.bam|samtools mpileup -| sam2pro -c 6 > 4.bam.pro
samtools view -b 5.bam|samtools mpileup -| sam2pro -c 6 > 5.bam.pro
...
```
```
$ cat bam2pro.txt | xargs -L 1 -I CMD -P 8 bash -c CMD
```
-P : run 8 lines simultaneously.
