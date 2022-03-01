#imports
from Bio import SeqIO
import sys
import csv
import re
import os


#functions
def grep(file_to_search,query_term):
    results=[]
    with open(file_to_search,"r") as file:
        for line in file:
            if re.search(query_term, line):
                results.append(line)
    return results

def cut_region(fasta,bed,gene):
    gene_loc=grep(bed,gene)
    gene_loc_tab=list(csv.reader(gene_loc, delimiter='\t'))
    result=""
    for i in range (0,len(gene_loc_tab)):
        chr=gene_loc_tab[i][0]
        start=int(gene_loc_tab[i][1])
        end=int(gene_loc_tab[i][2])
        #print(chr,":",start,":",end)
        result=result+fasta[chr].seq[start:(end+1)]
    return(result)

#terminal arguments
fasta_list_input=sys.argv[1]
bed_list_input=sys.argv[2]
gene_list_input=sys.argv[3]

#read files
with open(fasta_list_input) as file:
    fasta_list = file.read().splitlines()
file.close()
with open(bed_list_input) as file:
    bed_list = file.read().splitlines()
file.close()
with open(gene_list_input) as file:
    genes = file.read().splitlines()
file.close()

#main
for i in range(0,len(genes)):
    filename=str(genes[i]) + ".fasta"
    file = open (filename,"a")
    for j in range(0,len(fasta_list)) :
        with open(str(os.path.normpath(fasta_list[j]))) as handle:
            fasta_record = SeqIO.to_dict(SeqIO.parse(handle, "fasta"))
        bed_file=bed_list[j]
        header=">"+str((j+1))+"_"+genes[i]+"\n"
        file.write(header)
        file.write(str(cut_region(fasta_record,bed_file,genes[i])))
        file.write("\n")
