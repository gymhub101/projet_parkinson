#!/bin/bash

max_proc=$(grep proc criteres.txt | cut -d':' -f2 | tr -d ' ')

max_user=$(grep user criteres.txt | cut -d':' -f2 | tr -d ' ')

max_cpu=$(grep cpu criteres.txt | cut -d':' -f2 | tr -d ' ')

max_ram=$(grep  ram criteres.txt | cut -d':' -f2 | tr -d ' ')

max_disk=$(grep disk criteres.txt | cut -d':' -f2 | tr -d ' ')

max_histo=$(grep hist criteres.txt | cut -d':' -f2 | tr -d ' ')

proce=$(grep proc info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
users=$(grep user info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
cpu=$(grep CPU info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
ram=$(grep RAM info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
disk=$(grep disk info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')

proce1="[$(grep proc info_sh.txt | tail -n "$max_histo" | cut -d':' -f2 | tr -d ' ' | tr '\n' ',' | sed 's/,$//')]"
users1="[$(grep user info_sh.txt | tail -n "$max_histo"  | cut -d':' -f2 | tr -d ' ' | tr '\n' ',' | sed 's/,$//')]"
cpu1="[$(grep CPU info_sh.txt | tail -n "$max_histo"  | cut -d':' -f2 | tr -d ' ' | tr '\n' ',' | sed 's/,$//')]"
ram1="[$(grep RAM info_sh.txt | tail -n "$max_histo"  | cut -d':' -f2 | tr -d ' ' | tr '\n' ',' | sed 's/,$//')]"
disk1="[$(grep disk info_sh.txt | tail -n "$max_histo"  | cut -d':' -f2 | tr -d ' ' | tr '\n' ',' | sed 's/,$//')]"

date1="[$(grep 2026 info_sh.txt | tail -n "$max_histo" | sed -E '
s/^[a-zéû\.]+ //;
s/janvier/01/; s/février/02/;              
s/mars/03/; s/avril/04/; s/mai/05/;
s/juin/06/; s/juillet/07/; s/août/08/;
s/septembre/09/; s/octobre/10/; s/novembre/11/; s/décembre/12/;
s/ UTC$//                            
' | awk '{print $1"/"$2"/"$3" "$4}' | tr '\n' ',' | sed 's/,$//')]"

echo $proce1 > data.txt
echo $users1 >> data.txt
echo $cpu1 >> data.txt
echo $ram1 >> data.txt
echo $disk1 >> data.txt
echo $date1 >> data.txt

info="voici les caracteristiques critiques : "
mailing=false

if [ "$proce" -gt "$max_proc" ]; then
info="$info processus ($proce, limite : $max_proc)"
mailing=true
fi

if [ "$users" -gt "$max_user" ]; then
info="$info users ($users, limite : $max_user)"
mailing=true
fi

if [ "$cpu" -gt "$max_cpu" ]; then
info="$info cpu ($cpu, limite % : $max_cpu)"
mailing=true
fi

if [ "$ram" -gt "$max_ram" ]; then
info="$info ram ($ram, limite % : $max_ram)"
mailing=true
fi

if [ "$disk" -gt "$max_disk" ]; then
info="$info disk ($disk, limite % : $max_disk)"
mailing=true
fi


if [ "$mailing" = "true" ]; then
echo "$info" > aposter.txt
else
echo > aposter.txt
fi
