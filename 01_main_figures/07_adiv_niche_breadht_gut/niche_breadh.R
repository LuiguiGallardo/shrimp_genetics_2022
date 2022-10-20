#!/usr/bin/env Rscript
## Purpose of script: niche breadht barplot
## Date created: 23.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
# Package installation
#install.packages("colorRamps")
#install.packages("ggplot2")
#install.packages("reshape")
#install.packages("devtools")
#devtools::install_github("jaredhuling/jcolors")
library("colorRamps")
library("ggplot2")
library("reshape2")
library("scales")
library("jcolors")
library("ggpubr")
# Data input
table <- read.delim(file = "values_niche_widht_otu_table_s_0.01_gut_genetics.txt",
    header = TRUE)

# Define colors and variables
colors <- c("royalblue", "orangered")
p_value <- list(c("Genetic 1", "Genetic 2"))
# Plot
barplot_niche <- ggplot(table,
    aes(x = group,
        y = value),
        fill = group) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Niche breadth") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "wilcox.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))
# Creation of pdf
pdf(file = "niche_breadht_gut.pdf")
print(barplot_niche)
dev.off()
