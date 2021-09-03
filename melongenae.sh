for i in 1 3 4 5 7 8 9 11 12 14; do
for j in 1 3 4 5 7 8 9 11 12 14; do
if [ $j -gt $i ]; then
echo Running nucmer on ${i} on ${j}
nucmer ./megahit_${i}_scaffold/ragtag.scaffold.fasta ./megahit_${j}_scaffold/ragtag.scaffold.fasta -p ./melongenae/${i}_${j}_out
echo Running deltafilter on ${i}_${j}_out.delta
delta-filter -l 1000 -q ./melongenae/${i}_${j}_out.delta > ./melongenae/${i}_${j}_out.filtered.delta
echo Running mummerplot on ${i} on ${j}
mummerplot -f --fat --large --layout -png -p ./melongenae_plots/melongenae_${i}_${j} ./melongenae/${i}_${j}_out.filtered.delta
fi
done
done
