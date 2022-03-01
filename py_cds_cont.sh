for i in ./gene_files/*.fasta; do 
mafft --auto ${i} > ${i}.align; 
done

for i in *.align; do
seqkit split ${i} -i
done

for j in 1 3 4 5 7 8 9 11 12 14 34 35 36 37 38; do
find . -name "*${j}*.align" -exec cat {} + | union -filter  > ${j}.union.fasta
done

cat *.union.fasta
