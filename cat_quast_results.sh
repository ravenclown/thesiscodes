for i in $(seq 1 45);do
cd /home/mert/Desktop/Megahit_results/megahit_${i}_quast/
destdir=/home/mert/Desktop/final.tsv
awk 'FNR>1' transposed_report.tsv >>$destdir
done
