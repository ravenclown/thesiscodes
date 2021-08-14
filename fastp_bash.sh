#!/usr/bin/env bash
for x in $(seq 1 45); do
  if [ -d "/home/mert/Desktop/fusarium/$x" ]
  then
    cd /home/mert/Desktop/fusarium/$x/clean_data/
    declare -a arr
    i=0
    for file in *.fq.gz; do
      arr[$i]=$file
      let i++;
    done
    out1=${x}_read1.fq.gz
    out2=${x}_read2.fq.gz
    fastp --in1 ${arr[0]} --out1 ${out1} --in2 ${arr[1]} --out2 -z ${out2};
  fi
done
