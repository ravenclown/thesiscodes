for filename in *.fa; do
sub=$(echo $filename | cut -c 1-10)
echo Running ragtag on ${filename}
ragtag.py scaffold Reference_fusarium_genome ${filename} -o ${sub}_scaffold
echo Running nucmer on ${filename}
nucmer Reference_fusarium_genome ./${sub}_scaffold/ragtag.scaffold.fasta -p ./deltafiles/${sub}_out
echo Running mummerplot on ${filename}
mummerplot --fat --large --layout -png -p ./plots/${sub} ./deltafiles/${sub}_out.delta 
done
