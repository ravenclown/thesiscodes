#! usr/bin/bash

#for db creation
#makeblastdb -in phi-base_current.fas -dbtype prot -title phi-base-db

DB="phi-base-db"
FASTA=$1
OUTFILE=$2

blastp -query ${FASTA} -db ${DB} -outfmt 6 > ${OUTFILE}.tsv
