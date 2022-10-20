#!/usr/bin/env Rscript
## Purpose of script: Multiple Wilcoxon test
## Last modification: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("matrixTests")
library(matrixTests)

# Data input
table_health_genus <- read.table(file = "./health_probiotics_genus.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_health_specie <- read.table(file = "./health_probiotics_specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

table_health_genus_specie <- read.table(file = "./health_probiotics_genus-specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Group selection
health_healthy_genus <- table_health_genus[table_health_genus$group=="i-sano",2:ncol(table_health_genus)]
health_diseased_genus <- table_health_genus[table_health_genus$group=="i-enfermo",2:ncol(table_health_genus)]

health_healthy_specie <- table_health_specie[table_health_specie$group=="i-sano",2:ncol(table_health_specie)]
health_diseased_specie <- table_health_specie[table_health_specie$group=="i-enfermo",2:ncol(table_health_specie)]

health_healthy_genus_specie <- table_health_genus_specie[table_health_genus_specie$group=="i-sano",2:ncol(table_health_genus_specie)]
health_diseased_genus_specie <- table_health_genus_specie[table_health_genus_specie$group=="i-enfermo",2:ncol(table_health_genus_specie)]

# Wilcoxon
wilcoxon_health_genus <- col_wilcoxon_twosample(health_healthy_genus, health_diseased_genus)

wilcoxon_health_specie <- col_wilcoxon_twosample(health_healthy_specie, health_diseased_specie)

wilcoxon_health_genus_specie <- col_wilcoxon_twosample(health_healthy_genus_specie, health_diseased_genus_specie)

# Write table with results
write.table(wilcoxon_health_genus,
    file = "wilcoxon_health_probiotics_genus.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_health_specie,
    file = "wilcoxon_health_probiotics_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_health_genus_specie,
    file = "wilcoxon_health_probiotics_genus_specie.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)