#!/usr/bin/env
for filename in *.out.delta
do
  echo "Processing mummerplot on "$filename
  SUBSTRING=$(echo $filename| cut -c 1-2)
  base=`basename $SUBSTRING.plot`
  mummerplot -png -p ${base} -f $filename
  echo "Processing finished, $base saved as png"
done
