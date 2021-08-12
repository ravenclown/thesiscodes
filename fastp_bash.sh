#!/usr/bin
for i in $(seq 1 45);
do
  cd /home/mert/Masaüstü/fusarium/$i/clean_data/
  fastp -z --detect_adapter_for_pe --in1 *_1.fq.gz --out1 ${i}_read1 --in2 *_2.fq.gz --out2 ${i}_read2
done;
