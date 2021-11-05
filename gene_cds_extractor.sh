for i in $(seq -w 17781);do
mkdir temp_files
mkdir gene_files
mkdir align_files
for j in *.fasta; do
sample=echo cut -d "_" -f 2 ${j}
grep "CDS:FOXG_${i}" ${j} | cut -d '>' -f 2 | seqtk subseq ${j} - | union -filter | sed "s/>.*/>FOXG_${i}_/" > ./temp_files/${j}_${i}.fasta
done
cat ./temp_files/*.fasta > ./gene_files/FOXG_${i}.fasta
rm -r temp_files/
mafft ./gene_files/FOXG_${i}.fasta > ./align_files/FOXG_${i}.fasta.align
done
