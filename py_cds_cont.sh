for i in ./gene_files/*.fasta; do 
mafft --auto ${i} > ${i}.align; 
done

for i in *.align; do
seqkit split ${i} -i
done

for i in {1..15}; do 
find . -name "*id_${i}_*"-exec cat {} + | union -filter  > ${i}.union.fasta 
done

cat *.union.fasta
