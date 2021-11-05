#depedencies EMBOSS, seqtk, mafft, seqkit

#Enter SNAP.pl location
snap_loc=~/Desktop/Snap/SNAP.pl
#create folders
mkdir gene_files
mkdir align_files
mkdir snap_outputs

#main loop per gene
for i in $(seq -w 17781);do

#create temp folder
mkdir temp_files

#2nd loop per file
for j in *.fasta; do
sample=echo cut -d "_" -f 2 ${j}
grep "CDS:FOXG_${i}" ${j} | cut -d '>' -f 2 | seqtk subseq ${j} - | union -filter | sed "s/>.*/>${i}_/" > ./temp_files/${j}_${sample}.fasta
done

#concat CDS sequences in one file
cat ./temp_files/*.fasta > ./gene_files/FOXG_${i}.fasta

#delete temp files
rm -r temp_files/

#align with mafft
mafft ./gene_files/FOXG_${i}.fasta > ./align_files/FOXG_${i}.fasta.align

#Change align file to TAB delim file using seqkit
seqkit fx2tab ./align_files/FOXG_${i}.fasta.align > ./tab_files/FOXG_${i}.tab.align 

#SNAP.pl only accepts uppercase bases and N , - | change chars 
cat ./tab_files/FOXG_${i}.tab.align | tr [:lower:] [:upper:] > ./tab_files/temp.tab
cat ./tab_files/temp.tab > ./tab_files/FOXG_${i}.tab.align
rm ./tab_files/temp.tab

#create new folder for each gene snap, because snap creates several files 
cd snap_outputs
mkdir FOXG_${i}
cd FOXG_${i}
perl $snap_loc FOXG_${i}.tab.align 
cd ../..

done
