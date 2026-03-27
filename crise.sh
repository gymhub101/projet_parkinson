#!/bin/bash

max_proc=$(grep proc criteres.txt | cut -d':' -f2 | tr -d ' ')

max_user=$(grep user criteres.txt | cut -d':' -f2 | tr -d ' ')

max_cpu=$(grep cpu criteres.txt | cut -d':' -f2 | tr -d ' ')

max_ram=$(grep  ram criteres.txt | cut -d':' -f2 | tr -d ' ')

max_disk=$(grep disk criteres.txt | cut -d':' -f2 | tr -d ' ')

max_histo=$(grep hist criteres.txt | cut -d':' -f2 | tr -d ' ')
echo "$max_proc $max_user $max_cpu $max_ram $max_disk $max_histo"

proce=$(grep proc info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
users=$(grep user info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
cpu=$(grep CPU info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
ram=$(grep RAM info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
disk=$(grep disk info_sh.txt | tail -n1 | cut -d':' -f2 | tr -d ' ')
echo "$proce $users $cpu $ram $disk"
#CANT COMPARE FLOAT AND INT THATS WHY ERROR

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
info="$info cpu ($cpu, limite : $max_cpu)"
mailing=true
fi

if [ "$ram" -gt "$max_ram" ]; then
info="$info ram ($ram, limite : $max_ram)"
mailing=true
fi

if [ "$disk" -gt "$max_disk" ]; then
info="$info disk ($disk, limite : $max_disk)"
mailing=true
fi

if [ "$mailing" = "true" ]; then
echo "$info"
mail -s "SITUATION CRITIQUE DETECTEE DANS LE PARC INFORMATIQUE" abdoul-malik.aboubakar@univ-avignon.fr  < /etc/fstab

fi
