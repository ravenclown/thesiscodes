#usage splitbyannot.sh fasta_file annotation_file
#dependencies bedops bedtools
fasta=$1
annot=$2
gff2bed < $2 > $2.bed
bedtools getfasta -fi $1 -bed $2.bed -fo $1_gff_map.fasta 
