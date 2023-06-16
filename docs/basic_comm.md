# Linux directory
- <https://webdir.tistory.com/101>

[Coreutils](https://www.gnu.org/software/coreutils/) - GNU core utilities

<https://ftp.gnu.org/gnu/coreutils/>

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

## Delete all except myfile
```
$ find . ! -name myfile -delete 
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
- Conditional result
```
awk '{if($1 > 0){print $0} else {print $1}}' filename
```

## SED
```
$ sed '/MT/d' myfile > urfile  # d : delete lines which include 'MT' in myfile and make a result to urfile.

$ sed -i -e '/MT/d' -e '/GL/d' myfile  # -i : write in input file, -e : multiple command

$ sed -i 's/+/"/' myfile

$ sed -i '3iLINE contents' myfile  # 3i: 'LINE contents' is inserted into 3rd line of myfile.
```

## Replace a first line
```
$ tail -n +2 old.txt > old.tmp
$ cat head.txt old.tmp > new.txt
$ rm old.tmp
```

## Parallel
```
$ parallel -j 30 {} < myfile.txt
$ parallel -j3 --bar -S192.168.10.{21..25} -a command_file # spread 3 jobs to each of 192.168.10.{21..25}
```

## Job list
```
$ for i in {1..22} X Y;do ls ../chr$i/*.bam > chr$i.bam.filelist;done
$ for i in {1..22} X Y;do echo "angsd -b chr$i.bam.filelist -GL 1 -doMajorMinor 1 -doMaf 2 -out ./angsd_result/chr$i.out_samtools";done > angsd.samtools.list

$ parallel -j 24 {} < angsd.samtools.list
```

## Remove
```
find . -name '*.InGFE' -exec rm {} \;
```

## Less
If you want to see realtime file contents, the option is `+F`.
```
$ less +F myfile.txt
```

In order to trun off the word-warp in less, the option is `-S`.
```
$ less -S myfile.txt
```

## Sort
```
$ sort -nr -k 7 myfile.txt > newfile.txt
```
- `-n` : numeric data (4 5 X 2 9 Y -> X Y 2 4 5 9)
- `-r` : in reverse order (higher is first)
- `-k` : basis of any columns number
- `-u` : to sort and remove duplicate
- `-V` : version sort (4 5 X 2 9 Y -> 2 4 5 9 X Y)
- `-g` : general numeric sort

<https://www.geeksforgeeks.org/sort-command-linuxunix-examples/>

## Print
```
"23".zfill(3)
"23".rjust(3, '0')
"%03d"% 23
format(23,'03')
'{0:03d}'.format(23)
```
```
023
```

## Ulimit
```
$ ulimit -n # limit of handling number of files

$ sudo emacs /ect/security/limit.conf
user soft nofile    5000   # soft : warning when you open over 5000 files.
user hard nofile    10000  # hard : cannot open over than 10000 files.

$ sudo emacs /etc/profile
ulimit -n 100000
```

## String manipulation
<http://tldp.org/LDP/abs/html/string-manipulation.html>

## Uniq
<http://man7.org/linux/man-pages/man1/uniq.1.html>
```
  -c, --count           prefix lines by the number of occurrences
  -d, --repeated        only print duplicate lines, one for each group
  -D                    print all duplicate lines
      --all-repeated[=METHOD]  like -D, but allow separating groups
                                 with an empty line;
                                 METHOD={none(default),prepend,separate}
  -f, --skip-fields=N   avoid comparing the first N fields
      --group[=METHOD]  show all items, separating groups with an empty line;
                          METHOD={separate(default),prepend,append,both}
  -i, --ignore-case     ignore differences in case when comparing
  -s, --skip-chars=N    avoid comparing the first N characters
  -u, --unique          only print unique lines
  -z, --zero-terminated     line delimiter is NUL, not newline
  -w, --check-chars=N   compare no more than N characters in lines
      --help     display this help and exit
      --version  output version information and exit
```

## Transpose
```
$ tr -s ' '  '\n'< infile > outfile
or
$ for j in {1..10};do echo $j;done |paste -s > outfile 
```

## Time
<http://stackoverflow.com/a/556411/2223706>

Real, User and Sys process time statistics.

One of these things is not like the other. Real refers to actual elapsed time; User and Sys refer to CPU time used only by the process.

- **Real** is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).

- **User** is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.

- **Sys** is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.


## Rsync
<https://www.lesstif.com/system-admin/rsync-data-backup-12943658.html>
```
$ sshpass -p12345 rsync -avh --progress --update /DATA/ user@192.168.10.1:/BACKUP --log-file=./rsync20200807.log
```
- The files in `/DATA/` will be tranfered to `/BACKUP/` directory. If you run this command without `/` in `/DATA/`, the `/DATA/` will be trasfer to `/BACKUP/`. So that will be `/BACKUP/DATA/`.

## SSH Keys
```
$ ssh-keygen -t rsa
$ ssh-copy-id -i ~/.ssh/id_rsa.pub-p 1234 user@ipadd_to_connect_without_password
```

## Timezone
```
$ apt install tzdata
$ tzselect

$ ntpdate -u time.wisdows.com
```

## Find
```
$ find -iname *.png -exec cp {} copy_path \;
$ find -iname *.png | xargs -n 100 cp -t copy_path
```
