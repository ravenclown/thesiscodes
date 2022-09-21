#! /usr/bin/bash

#download merops lib
#wget ftp://ftp.ebi.ac.uk/pub/databases/merops/current_release/pepunit.lib

#make makeblastdb
#makeblastdb -in pepunit.lib -dbtype prot -title merops-db

DB="merops-db"
FASTA=$1
OUTFILE=$2

blastp -query ${FASTA} -db ${DB} -outfmt 6 > ${OUTFILE}.tsv
