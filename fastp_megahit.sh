for x in $(seq 1 45); do
cd /home/mert/Desktop/Tez/Original/$x/clean_data
declare -a arr
i=0
for filename in 17*.fq.gz; do
arr[$i]=$filename
let i++;
done
out1=${x}_read1.fq.gz
out2=${x}_read2.fq.gz
echo Trimming $x
fastp --in1 ${arr[0]} --out1 ${out1} --in2 ${arr[1]} --out2 ${out2};
echo Assembling $x
megahit -1 ${out1} -2 ${out2} -o megahit_${x}
done
