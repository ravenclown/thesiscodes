for i in $(seq 1 45); do
cd /home/mert/Desktop/Megahit_results/megahit_${i}_scaffold/
for file in *.fasta; do
sed -i 's/Fusarium_oxysporum_f._sp._lycopersici_4287_chromosome_/Chr_/g' ${file}
sed -i 's/_genomic_scaffold,/_GS,/g' ${file}
sed -i 's/_whole_genome_shotgun_sequence_RagTag/WGS_RT/g' ${file}
sed -i 's/Fusarium_oxysporum_f._sp._lycopersici_4287_supercont2/SprCnt/g' ${file}
done
done
