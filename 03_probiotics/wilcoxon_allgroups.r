#!/usr/bin/env Rscript
## Purpose of script: Multiple Wilcoxon test
## Last modification: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("matrixTests")
library(matrixTests)

# Data input
table <- read.table(file = "./allsamples_median.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

hep_gen1 <- table[table$group=="hep_gen1",2:ncol(table)]
hep_gen2 <- table[table$group=="hep_gen2",2:ncol(table)]
gut_gen1 <- table[table$group=="gut_gen1",2:ncol(table)]
gut_gen2 <- table[table$group=="gut_gen2",2:ncol(table)]
gut_healthy <- table[table$group=="gut_healthy",2:ncol(table)]
gut_diseased <- table[table$group=="gut_diseased",2:ncol(table)]

# Multiple Wilcoxon test
wilcoxon_hep <- col_wilcoxon_twosample(hep_gen1, hep_gen2)
wilcoxon_gut <- col_wilcoxon_twosample(gut_gen1, gut_gen2)
wilcoxon_health <- col_wilcoxon_twosample(gut_healthy, gut_diseased)

# Write table with results
write.table(wilcoxon_hep,
    file = "wilcoxon_hep.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_gut,
    file = "wilcoxon_gut.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)

write.table(wilcoxon_health,
    file = "wilcoxon_health.txt",
    sep = "\t",
    quote = FALSE,
col.names = NA)