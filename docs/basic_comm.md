# Basic command
- pdsh : run a command on multiple nodes in parallel
> - pdsh -w 'node_name'

---
**Ref** : <a href="https://linux.die.net/man/1/pdsh" target="_blank"> https://linux.die.net/man/1/pdsh </a>

# Read dataframe
```
f=filename.csv ; column -s, -t < ${f} | less -#2 -N -S
```
