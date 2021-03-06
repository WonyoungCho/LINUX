# Preparation
```python
import pandas as pd
import numpy as np

df_notFound=pd.DataFrame()
df_minorAmb=pd.DataFrame()

chrmList=list(map(str, range(1,23)))+['X','Y']

maxChrm1=0
maxChrm2=0
kind='kind'
path='./'+kind+'/GFE_Result/'

for nb in chrmList:
    df=pd.read_csv(path+'GFE_chr'+nb+'_info.txt',sep='\s+',header=None)
    df=df.drop(df.shape[0]-1,axis=0)

    notFound=df[6][df[6]!='is'].dropna().reset_index(drop=True).astype(int)
    #notFound=df[6].str.extract('(\d+)').dropna().T

    minorAmb=df[10].dropna().reset_index(drop=True).astype(int)

    maxChrm1= max(maxChrm1,notFound.shape[0])
    maxChrm2= max(maxChrm2,minorAmb.shape[0])

    if notFound.shape[0]==maxChrm1: nf_chrm=nb
    if minorAmb.shape[0]==maxChrm2: ma_chrm=nb

chrmList1=list(map(str, range(1,23)))+['X','Y']
chrmList2=list(map(str, range(1,23)))+['X','Y']

chrmList1.remove(nf_chrm)
chrmList2.remove(ma_chrm)

for nb in [str(nf_chrm)]+chrmList1:
    df=pd.read_csv(path+'GFE_chr'+nb+'_info.txt',sep='\s+',header=None)
    df=df.drop(df.shape[0]-1,axis=0)

    notFound=df[6][df[6]!='is'].dropna().reset_index(drop=True)
    df_notFound['chr'+nb]=notFound


for nb in [str(ma_chrm)]+chrmList2:
    df=pd.read_csv(path+'GFE_chr'+nb+'_info.txt',sep='\s+',header=None)
    df=df.drop(df.shape[0]-1,axis=0)

    df=df.apply(pd.to_numeric,errors='ignore')
    df[10]=df[10].dropna().astype(np.int)

    minorAmb=df[10].dropna().reset_index(drop=True)
    df_minorAmb['chr'+nb]=minorAmb

new_chrmList=[]
for nb in chrmList:
    new_chrmList.append('chr'+nb)

df_notFound=df_notFound[new_chrmList].fillna(0)
df_minorAmb=df_minorAmb[new_chrmList].fillna(0)

df_notFound.loc[df_notFound.shape[0]]=0
df_minorAmb.loc[df_minorAmb.shape[0]]=0

print(df_notFound)
print(df_minorAmb)

df_notFound.to_csv(path+'MLnotFound_site.txt',index=None,sep='\t',header=None)
df_minorAmb.to_csv(path+'ambiguous_site.txt',index=None,sep='\t', float_format='%.0f',header=None)
```

# Search
```bash
#!/bin/bash

chrm=$@

input="ambiguous_site.txt"
while read -r line
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


# Run script
```bash
#!/bin/bash

for i in {1..22} X Y

do
    /awork04-2/PTSCAN_WYC/ADNI/GFE_Result/ambiguous.sh $i &> amb_chr$i.txt &
done
```

# Replace
```bash
#!/bin/bash

sed -i 's/-/"/' pro2chrms.txt
```

# Combine
```bash
#!/bin/bash

arg=("$@")

paste hs38_${arg[1]} In_GFE_${arg[1]}.* > In_GFE_${arg[1]}.txt && sm.sh Done_to_combine_${arg[0]}_In_GFE_${arg[1]}_files || echo "Not combined In_GFE_"${arg[1]}"_files"
```

# Send email
```bash
#!/bin/bash

ssh userID@192.168.0.1 'mail -s "Your job is completed." mailID@mail.com <<< '$@
```

# Split jobs
```
#!/bin/bash

step=1
file=cmdlist.txt

for i in {0..367}
do
    a=splits${i}
    for ((j=i; j<=1346;j+=368))
    do
        echo "python test.py $j $step"
    done > $a

done

for i in {0..22}
do
    a=split${i}
    rm $a
    for ((j=i; j<=367;j+=16))
    do
        cat splits$j >> $a
    done
done

rm splits*
```
