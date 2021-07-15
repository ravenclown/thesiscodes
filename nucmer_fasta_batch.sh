#!/usr/bin/env
for filename in *.sorted.fasta
do
  echo "Processing nucmer on "$filename
  SUBSTRING=$(echo $filename| cut -c 1-2)
  base=`basename $SUBSTRING.out`
  nucmer -p ${base} $filename fusarium_reference_clean.fasta
  echo "Processing finished, output $base created"
done
