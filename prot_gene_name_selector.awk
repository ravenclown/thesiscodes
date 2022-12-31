#! /usr/bin/awk -f  
BEGIN n=split($9,a,";") {print $1"\t"substr(a[1],8,20)"\t"substr(a[6],11,20)}
