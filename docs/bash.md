# Search
```bash
#!/bin/bash

chrm=$@

input="ambiguous_site.txt"
while read line
arg=($line)
do
    if [ $chrm == "X" ]; then
        if [ "${arg[$((22))]}" == 0 ]; then exit 0; fi
        cat Out_GFE_chr$chrm.txt |grep -m 1 "${arg[$((22))]}"
    elif [ $chrm == "Y" ]; then
        if [ "${arg[$((23))]}" == 0 ]; then exit 0; fi
        cat Out_GFE_chr$chrm.txt |grep -m 1 "${arg[$((23))]}"
    else
        if [ "${arg[$((chrm-1))]}"  == 0 ]; then exit 0; fi
        cat Out_GFE_chr$chrm.txt |grep -m 1 "${arg[$((chrm-1))]}"
    fi
done < "$input"
```
- <https://stackoverflow.com/questions/14093452/grep-only-the-first-match-and-stop>


# Run script
```
#!/bin/bash

for i in {1..22} X Y

do
    /awork04-2/PTSCAN_WYC/ADNI/GFE_Result/ambiguous.sh $i &> amb_chr$i.txt &
done
```

# Replace
```
#!/bin/bash

sed -i 's/-/"/' pro2chrms.txt
```

# Combine
```
#!/bin/bash

arg=("$@")

paste hs38_${arg[1]} In_GFE_${arg[1]}.* > In_GFE_${arg[1]}.txt && sm.sh Done_to_combine_${arg[0]}_In_GFE_${arg[1]}_files || echo "Not combined In_GFE_"${arg[1]}"_files"
```

# Send email
```
#!/bin/bash

ssh userID@192.168.0.1 'mail -s "Your job is completed." mailID@mail.com <<< '$@
```
