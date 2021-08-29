for i in $(seq 1 45);do
  for x in 21 29 39 59 79 99 119 141; do
    cp /home/mert/Desktop/Tez/Original/$i/clean_data/megahit_${i}_trimmed/intermediate_contigs/k${x}.contigs.fa /home/mert/Desktop/Megahit_allkmers/megahit_${i}_k${x}.contigs.fa
done
done
