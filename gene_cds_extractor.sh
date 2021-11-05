#dependencies seqkit, seqtk, EMBOSS, sed, snapHIV, mafft

for i in $(seq -w 17781);do
mkdir temp_files
mkdir gene_files
mkdir align_files
mkdir tab_files
for j in *.fasta; do
sample=echo cut -d "_" -f 2 ${j}
grep "CDS:FOXG_${i}" ${j} | cut -d '>' -f 2 | seqtk subseq ${j} - | union -filter | sed "s/>.*/>${i}_/" > ./temp_files/${j}_${i}.fasta
done
cat ./temp_files/*.fasta > ./gene_files/FOXG_${i}.fasta
rm -r temp_files/
mafft ./gene_files/FOXG_${i}.fasta > ./align_files/FOXG_${i}.fasta.align
seqkit fx2tab ./align_files/FOXG_${i}.fasta.align > ./tab_files/FOXG_${i}.tab.align 
done
