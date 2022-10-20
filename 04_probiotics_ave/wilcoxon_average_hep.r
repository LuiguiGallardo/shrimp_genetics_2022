#!/usr/bin/env Rscript
## Purpose of script: Multiple Wilcoxon test
## Last modification: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("matrixTests")
library(matrixTests)

# Data input
table_hep_genus <- read.table(file = "./hep_probiotics_genus.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_hep_specie <- read.table(file = "./hep_probiotics_specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_hep_genus_specie <- read.table(file = "./hep_probiotics_genus-specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Group selection
hep_gen1_genus <- table_hep_genus[table_hep_genus$group=="Genetic 1",2:ncol(table_hep_genus)]
hep_gen2_genus <- table_hep_genus[table_hep_genus$group=="Genetic 2",2:ncol(table_hep_genus)]

hep_gen1_specie <- table_hep_specie[table_hep_specie$group=="Genetic 1",2:ncol(table_hep_specie)]
hep_gen2_specie <- table_hep_specie[table_hep_specie$group=="Genetic 2",2:ncol(table_hep_specie)]

hep_gen1_genus_specie <- table_hep_genus_specie[table_hep_genus_specie$group=="Genetic 1",2:ncol(table_hep_genus_specie)]
hep_gen2_genus_specie <- table_hep_genus_specie[table_hep_genus_specie$group=="Genetic 2",2:ncol(table_hep_genus_specie)]

# Wilcoxon
wilcoxon_hep_genus <- col_wilcoxon_twosample(hep_gen1_genus, hep_gen2_genus)

wilcoxon_hep_specie <- col_wilcoxon_twosample(hep_gen1_specie, hep_gen2_specie)

wilcoxon_hep_genus_specie <- col_wilcoxon_twosample(hep_gen1_genus_specie, hep_gen2_genus_specie)

# Write table with results
write.table(wilcoxon_hep_genus,
    file = "wilcoxon_hep_probiotics_genus.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_hep_specie,
    file = "wilcoxon_hep_probiotics_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_hep_genus_specie,
    file = "wilcoxon_hep_probiotics_genus_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)