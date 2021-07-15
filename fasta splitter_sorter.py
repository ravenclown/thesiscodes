import os
from Bio import SeqIO
entries = os.listdir("D:/TEZ/Consensus")
print(entries)
# select all files in directory

for entry in entries:
    file = "D:/TEZ/Consensus/" + entry
    sorted_chr_seq = [0] * 15
    contig_seq = []
    chr_seq = []
    print(file)
    # split fasta
    with open (file) as handle:
        for seq_record in SeqIO.parse(handle , "fasta"):
            if len(seq_record.seq) < 1000000:
                contig_seq.append(seq_record)
            else:
                chr_seq.append(seq_record)
    # sort chr

    for val in range(len(chr_seq)):
        sorted_chr_seq[int(chr_seq[val].id) - 1] = chr_seq[val]
    # write files
    sorted_chr_seq_loc = "D:/TEZ/Py_clean/" + entry[0:2] + ".sorted.fasta"
    SeqIO.write(sorted_chr_seq, sorted_chr_seq_loc, "fasta")
    contig_seq_loc = "D:/TEZ/Py_contig/" + entry[0:2] + ".contig.fasta"
    SeqIO.write(contig_seq, contig_seq_loc, "fasta")
