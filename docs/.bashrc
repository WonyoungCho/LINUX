# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias edt='emacs -nw ~/.bashrc'
alias em='emacs -nw'
alias sem='sudo emacs -nw'
alias l='ls -vxCF'
alias ll='ls -alhvF'
alias df='df -h'
alias du='du -h'

# directory
alias cdp='cd /lwork01/program'
alias cdi='cd /IDAB2'
alias cda='cd /IDAB2/proj_200825'

alias rsync='rsync -avh --progress --update'

alias htop='htop -u user1 -s PERCENT_CPU'

alias edm='em ~/.tmux.conf'
#alias sq='squeue -o"%.7i %.9P %.8j %.8u %.2t %.10M %.6D %C"'
alias sq='squeue -S LIST -l'

alias less='less -S'

function cv() { column -ts $'\t' $1 |less;}
function btz() { bcftools view --threads 4 -Oz -o $1.gz $1 && bcftools index --threads 4 $1.gz;}

alias prl="bash -c '(for i in {1..22};do eval echo \$@ ;done) |parallel  \"{}\" ' _"

alias sendbash="cat /home/user1/node.lst|while read line;do scp /home/user1/.bashrc \${line}:/home/user1/;done"

# Program
alias bt="bcftools"
alias bv="bcftools view"
alias bti="bcftools index --threads 4"
alias btin="bcftools index -n"
alias btis="bcftools index -s"
alias btql="bcftools query -l"

alias beagle="java -jar /lwork01/program/beagle/beagle.18May20.d20.jar"
alias picard="java -jar /lwork01/program/picard/build/libs/picard.jar"
alias eds='emacs -nw /develop/hilscan/hilmap.py'
alias pds='/develop/hilscan/hilmap.py'

alias esg="emacs -nw /develop/samgen/samgen.py"
alias psg="/develop/samgen/samgen.py"

alias scu="scancel -uuser1"

alias wt="watch \"ls -alth\""
alias wts="watch squeue -S LIST -l"

# For tmux
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

source scl_source enable devtoolset-7

export PATH="/develop/samgen:/develop/hilscan:/lwork01/program/LDhat:/lwork01/program/combo:/lwork01/program/plink:/lwork01/program/ldpop/run:/lwork01/program/shapeit4/bin:/usr/local/cuda/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
