for filename in *.fa; do
sub=$(echo $filename | cut -c 1-10)
echo Running ragtag on ${filename}
ragtag.py scaffold Reference_fusarium_genome ${filename} -o ${sub}_scaffold -f 50 --remove-small -C -w --aligner nucmer --nucmer-params '--mum -l 20 -c 65'
echo Running nucmer on ${filename}
nucmer Reference_fusarium_genome ./${sub}_scaffold/ragtag.scaffold.fasta -p ./deltafiles/${sub}_out
echo Running mummerplot on ${filename}
delta-filter -l 1000 -q ./deltafiles/${sub}_out.delta > ./deltafiles/${sub}_out.filtered.delta
mummerplot -f --fat --large --layout -png -p ./plots/${sub} ./deltafiles/${sub}_out.delta 
done
