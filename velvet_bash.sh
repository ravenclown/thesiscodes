for i in $(seq 1 45); do
cd /home/mert/Desktop/fusarium/$i/clean_data
name=${i}_assembly
fn1=${i}_read1.fq.gz
fn2=${i}_read2.fq.gz
velveth ${name} 69,149,10 -create_binary -shortPaired -fastq.gz -separate ${fn1} ${fn2}

for((n=69; n<=149; n=n+10));
do
velvetg "${name}"_"$n" \
-cov_cutoff 0 \
-exp_cov auto \
-min_contig_lgth 300 \
-ins_length 400 \
-clean yes \
-unused_reads no \
-min_pair_count 3 \
-scaffolding no
done

rm "${name}"_*/CnyUnifiedSeq*
rm "${name}"_*/*Graph*

cat "${name}"_*/contigs.fa > all.contigs.fa

done
