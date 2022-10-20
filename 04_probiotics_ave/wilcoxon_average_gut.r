#!/usr/bin/env Rscript
## Purpose of script: Multiple Wilcoxon test
## Last modification: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("matrixTests")
library(matrixTests)

# Data input
table_gut_genus <- read.table(file = "./gut_probiotics_genus.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_gut_specie <- read.table(file = "./gut_probiotics_specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_gut_genus_specie <- read.table(file = "./gut_probiotics_genus-specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Group selection
gut_gen1_genus <- table_gut_genus[table_gut_genus$group=="Genetic 1",2:ncol(table_gut_genus)]
gut_gen2_genus <- table_gut_genus[table_gut_genus$group=="Genetic 2",2:ncol(table_gut_genus)]

gut_gen1_specie <- table_gut_specie[table_gut_specie$group=="Genetic 1",2:ncol(table_gut_specie)]
gut_gen2_specie <- table_gut_specie[table_gut_specie$group=="Genetic 2",2:ncol(table_gut_specie)]

gut_gen1_genus_specie <- table_gut_genus_specie[table_gut_genus_specie$group=="Genetic 1",2:ncol(table_gut_genus_specie)]
gut_gen2_genus_specie <- table_gut_genus_specie[table_gut_genus_specie$group=="Genetic 2",2:ncol(table_gut_genus_specie)]

# Wilcoxon
wilcoxon_gut_genus <- col_wilcoxon_twosample(gut_gen1_genus, gut_gen2_genus)

wilcoxon_gut_specie <- col_wilcoxon_twosample(gut_gen1_specie, gut_gen2_specie)

wilcoxon_gut_genus_specie <- col_wilcoxon_twosample(gut_gen1_genus_specie, gut_gen2_genus_specie)

# Write table with results
write.table(wilcoxon_gut_genus,
    file = "wilcoxon_gut_probiotics_genus.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_gut_specie,
    file = "wilcoxon_gut_probiotics_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_gut_genus_specie,
    file = "wilcoxon_gut_probiotics_genus_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)