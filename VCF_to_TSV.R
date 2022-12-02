library("vcfR")
library("dplyr")
setwd("~/Documents/Fox_mert/snpeff_results/")
#read vcf file
vcffile <- read.vcfR("13S_fomgarticle_annotated_cc_filtered.vcf")
#create new df 
newvcf <- data.frame()
#put chr,pos and qual slots to df
newvcf <- cbind.data.frame(vcffile@fix[,1])
newvcf <- cbind.data.frame(newvcf,vcffile@fix[,2])
newvcf <- cbind.data.frame(newvcf,vcffile@fix[,6])
#get GT value and cut to first char
test <- as.data.frame(substr(vcffile@gt[,2:14],0,1))
#Transform all chars to numeric
test <- mutate_all(test, function(x) as.numeric(as.character(x)))
#change every GT > 1 to 1 (to see as 0 or 1)
test[test>1] <- as.numeric("1")
#count for each group and write to total slot 
test <- cbind.data.frame(test, FOMG_freq = as.numeric(rowSums(test[-(6:8)],na.rm=T)))
test <- cbind.data.frame(test, FO_freq = as.numeric(rowSums(test[6:8],na.rm=T)))
#change Column Names
colnames(newvcf) <- c("Chromosome","Position","Qual")
#Add frequency to df
newvcf <- cbind(newvcf,test[,14:15])
#export as tsv

write.table(newvcf, file='test_table.tsv', quote=FALSE, sep='\t', col.names = T)
