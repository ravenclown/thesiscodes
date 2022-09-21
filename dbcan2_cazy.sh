#! usr/bin/bash
#hmmscan must be installed and added to PATH

HMMPARSER=/path/to/hmmscan-parser.h
WD=/path/to/files
FASTA=$1
OUTFILE=$2

#wget https://bcb.unl.edu/dbCAN2/download/Databases/V11/ -r --no-clobber --no-parent
#download hmmDB and dbcan2 for cazy

hmmpress dbCAN-HMMdb-V11.txt
hmmscan --domtblout ${OUTFILE}.out.dm dbCAN-HMMdb-V11.txt ${FASTA} > ${OUTFILE}.out
sh ${HMMPARSER}/hmmscan-parser.sh ${OUTFILE}.out.dm > ${OUTFILE}.out.dm.ps
cat ${OUTFILE}.out.dm.ps | awk '$5<1e-15&&$10>0.35' > ${OUTFILE}.out.dm.ps.stringent
