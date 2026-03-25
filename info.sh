#!/bin/bash

echo
c=$(ps | wc -l)
echo "nombre de proc : $c"
echo
e=$(who | wc -l)
echo "nbe d'users co : $e"
echo
a=$(top -bn1 | grep 'Cpu(s)' | awk '{print 0 + $8}')
echo "usage CPU (%)  : $a"
echo
b=$(free -m | grep "Mem" | awk '{print $3*100/$2 }')
echo "usage RAM (%)  : $b"
echo
d=$(df -h / | grep "dev" | awk '{print $3*100/$2 }')
echo "usage disk (%) : $d"
echo
