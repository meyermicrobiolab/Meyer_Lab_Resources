library(phyloseq)

createPsObject <- function (otuTable,taxaTable, metadata){
otu <- read.table(otuTable,sep="\t",header=TRUE, row.names=1)
taxon <- read.table(taxaTable,sep="\t",header=TRUE,row.names=1)
samples<-read.table(metadata,sep="\t",header=T,row.names=1)
OTU = otu_table(otu, taxa_are_rows=FALSE)
print(class(OTU))
taxon<-as.matrix(taxon)
TAX = tax_table(taxon)
sampledata = sample_data(samples)
ps <- phyloseq(otu_table(otu, taxa_are_rows=FALSE), 
               sample_data(samples), 
               tax_table(taxon))
ps <- prune_samples(sample_names(ps), ps)
print(ps)
return (ps)
}