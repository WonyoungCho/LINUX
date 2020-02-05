# Linux directory
- <https://webdir.tistory.com/101>

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
Make a command file using python.
```
import pandas as pd


df=pd.read_csv('list.txt',header=None)
df.columns=['FILE']
df['CMD']='samtools view -b '+df['FILE']+'|samtools mpileup -| sam2pro -c 6 > '+ df['FILE']+'.pro'

print(df['CMD'])

df['CMD'].to_csv('bam2pro.txt',index=None,header=None)
```

When we run jobs, the xargs is used to run commands line by line.
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

## OS
```
import os
os.path.isfile(myfile) # the file existence
os.getcwd() # the current directory
os.path.realpath(__file__) # save the file directory
os.path.dirname(os.path.realpath(__file__)) )# the file directory
```

## SCP
```
$ scp -o StrictHostKeyChecking=no
```

## AWK
- To see the first column's unique items. -F : sepator
```
$ awk -F" " '!_[$1]++' filename
```
- To find rows which have 'chr1'
```
$ awk '$1 == "chr1" {print}' filename > newfile
```
- With two separator, . and /
```
$ awk -F'[./]' {print $1} filename
```
- Find maximum value
```
$ awk -F/ 'BEGIN {max = 0} {if ($1>max) max=$1} END {print max}' filename
```

## SED
```
$ sed '/MT/d' myfile > urfile  # d : delete lines which include 'MT' in myfile and make a result to urfile.

$ sed -i -e '/MT/d' -e '/GL/d' myfile  # -i : write in input file, -e : multiple command

$ sed -i 's/+/"/' myfile

$ sed '3iLINE contents' myfile > outfile  # 3i: 'LINE contents' is inserted into 3rd line of myfile.
```

## Parallel
```
$ parallel -j 30 {} < myfile.txt
```

## Job list
```
$ for i in {1..22} X Y;do ls ../chr$i/*.bam > chr$i.bam.filelist;done
$ for i in {1..22} X Y;do echo "angsd -b chr$i.bam.filelist -GL 1 -doMajorMinor 1 -doMaf 2 -out ./angsd_result/chr$i.out_samtools";done > angsd.samtools.list

$ parallel -j 24 {} < angsd.samtools.list
```

# Remove
```
find . -name '*.InGFE' -exec rm {} \;
```

# Less
If you want to see realtime file contents, the option is `+F`.
```
$ less +F myfile.txt
```

In order to trun off the word-warp in less, the option is `-S`.
```
$ less -S myfile.txt
```

# Sort
```
$ sort -nr -k 7 myfile.txt > newfile.txt
```
- `-n` : numeric data
- `-r` : in reverse order (higher is first)
- `-k` : basis of any columns number
<https://www.geeksforgeeks.org/sort-command-linuxunix-examples/>
