#!/bin/bash

echo
c=$(ps | wc -l)
echo "nombre de proc : $c"
echo
e=$(who | wc -l)
echo "nbe d'users co : $e"
echo
a=$(top -bn1 | awk '/Cpu/ { print $7}' | cut -d"," -f2 | bc -l)
echo "usage CPU (%)  : $a"
echo
b=$(free -m | grep "Mem" | awk '{printf "%.0f\n", $3*100/$2 }')
echo "usage RAM (%)  : $b"
echo
d=$(df -h / | grep "dev" | awk '{print $3*100/$2 }' | bc -l)
echo "usage disk (%) : $d"
echo
