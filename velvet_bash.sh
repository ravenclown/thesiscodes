for i in $(seq 1 45); do
cd /home/mert/Desktop/fusarium/$i/clean_data
name=${i}_assembly
fn1=${i}_read1.fq.gz
fn2=${i}_read2.fq.gz
velveth ${name} 99,149 -shortPaired -fastq.gz -separate ${fn1} ${fn2}
done
