#!/bin/bash

echo
c=$(ps | wc -l)
echo "nombre de proc : $c"
echo
e=$(who | wc -l)
echo "nbe d'users co : $e"
echo
a=$(top -bn1 | grep "Cpu(s)" | grep -o '[0-9.]\+ id' | cut -d' ' -f1 | awk '{print int($1+0.5)}')
echo "usage CPU (%)  : $a"
echo
b=$(free -m | grep "Mem" | awk '{printf "%.0f\n", $3*100/$2 }')
echo "usage RAM (%)  : $b"
echo
d=$(df -h / | grep "dev" | awk '{printf "%.0f\n", $3*100/$2 }')
echo "usage disk (%) : $d"
echo
