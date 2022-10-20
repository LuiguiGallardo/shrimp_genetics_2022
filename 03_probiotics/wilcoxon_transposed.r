#!/usr/bin/env Rscript
## Purpose of script: Multiple Wilcoxon test
## Last modification: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("matrixTests")
library(matrixTests)

# Data input
table_hep_genus <- read.table(file = "./hep_probiotics_genus_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_hep_genus <- as.data.frame(t(table_hep_genus))

table_hep_specie <- read.table(file = "./hep_probiotics_specie_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_hep_specie <- as.data.frame(t(table_hep_specie))

table_gut_genus <- read.table(file = "./gut_probiotics_genus_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_gut_genus <- as.data.frame(t(table_gut_genus))

table_gut_specie <- read.table(file = "./gut_probiotics_specie_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_gut_specie <- as.data.frame(t(table_gut_specie))

table_health_genus <- read.table(file = "./health_probiotics_genus_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_health_genus <- as.data.frame(t(table_health_genus))

table_health_specie <- read.table(file = "./health_probiotics_specie_transposed.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)
table_health_specie <- as.data.frame(t(table_health_specie))

# Multiple Wilcoxon test
wilcoxon_hep_genus <- col_wilcoxon_twosample(table_hep_genus$hep_gen1, table_hep_genus$hep_gen2)
wilcoxon_hep_specie <- col_wilcoxon_twosample(table_hep_specie$hep_gen1, table_hep_specie$hep_gen2)

wilcoxon_gut_genus <- col_wilcoxon_twosample(table_gut_genus$gut_gen1, table_gut_genus$gut_gen2)
wilcoxon_gut_specie <- col_wilcoxon_twosample(table_gut_specie$gut_gen1, table_gut_specie$gut_gen2)

wilcoxon_health_genus <- col_wilcoxon_twosample(table_health_genus$gut_healthy, table_health_genus$gut_diseased)
wilcoxon_health_specie <- col_wilcoxon_twosample(table_health_specie$gut_healthy, table_health_specie$gut_diseased)

# Write table with results
write.table(wilcoxon_hep_genus,
    file = "wilcoxon_hep_probiotics_genus_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_hep_specie,
    file = "wilcoxon_hep_probiotics_specie_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_gut_genus,
    file = "wilcoxon_gut_probiotics_genus_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_gut_specie,
    file = "wilcoxon_gut_probiotics_specie_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_health_genus,
    file = "wilcoxon_health_probiotics_genus_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_health_specie,
    file = "wilcoxon_health_probiotics_specie_transposed.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)
