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
When we run jobs, xargs is used to run commands line by line.
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
```
-L 1 : splits by each lines
-I CMD : replace-str to command
-P 8 : run 8 lines simultaneously
bash -c CMD : run cmd
bash -i : run an interactive shell (and sources .bashrc)
```
```
Quoting from man bash:

-c string
     If the -c option is present, then commands are read from string.
     If there are arguments after the string, they are assigned to the positional
     parameters, starting with $0.
```
- <https://mug896.github.io/bash-shell/interactive_non-interactive.html>
- <https://linux.die.net/man/1/bash>
- <https://www.gnu.org/software/findutils/manual/html_node/find_html/xargs-options.html>

## gz file
```
$ gzip -d xxx.gz
```

## SCP
```
$ scp -o StrictHostKeyChecking=no
```
