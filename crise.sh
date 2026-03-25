#!/bin/bash

max_proc=$(grep proc criteres.txt | cut -d':' -f2)
echo "$max_proc"
max_user=$(grep user criteres.txt | cut -d':' -f2)
echo "$max_user"
max_cpu=$(grep cpu criteres.txt | cut -d':' -f2)
echo "$max_cpu"
max_ram=$(grep  ram criteres.txt | cut -d':' -f2)
echo "$max_ram"
max_disk=$(grep proc criteres.txt | cut -d':' -f2)
echo "$max_disk"
max_histo=$(grep hist criteres.txt | cut -d':' -f2)
echo "$max_histo"

proce=$(grep proc info_sh.txt | tail -n1 | cut -d':' -f2 | sed "s/ //g")
users=$(grep user info_sh.txt | tail -n1 | cut -d':' -f2 | sed "s/ //g")
cpu=$(grep CPU info_sh.txt | tail -n1 | cut -d':' -f2 | sed "s/ //g")
ram=$(grep RAM info_sh.txt | tail -n1 | cut -d':' -f2 | sed "s/ //g")
disk=$(grep disk info_sh.txt | tail -n1 | cut -d':' -f2 | sed "s/ //g")

mail_label=()
mail_val=()

if ["$proce" -gt "$max_proce"]; then
mail_label=('processus')
mail_val=("$proce")

fi

if ["$users" -gt "$max_user"]; then
mail_label+=('utilisateurs')
mail_val+=("$users")

fi

if["$cpu" -gt "$max_cpu"]; then
mail_label+=('cpu')
mail_val+=("$cpu")

fi

if ["$ram" -gt "$max_ram"]; then
mail_label+=('ram')
mail_val+=("$ram")

fi

if ["$disk" -gt "$max_disk"]; then
mail_label+=('disque')
mail_val+=("$disk")

fi
