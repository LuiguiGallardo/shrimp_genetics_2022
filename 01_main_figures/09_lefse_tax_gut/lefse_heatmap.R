#!/usr/bin/env Rscript
## Purpose of script: alpha diversity boxplot
## Date created: 22.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
# Package installation
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("ggpubr")
library("dplyr")
library("ggplot2")
library("gridExtra")
# Data input
table <- read.table(file = "gut_lefse_taxa.txt",
    sep = "\t", header = T)
table_heatmap <- read.table(file = "gut_lefse_taxa_heatmap_samples.txt",
    sep = "\t", header = T)
# Define colors
colors <- c("royalblue", "orangered")
# Barplot
barplot <- ggplot(data = table,
    aes(x = reorder(gut_taxa, -order),
    y = lda,
    fill = group)) +
geom_bar(stat = "identity") +
theme_test() +
coord_flip() +
scale_fill_manual(values = colors) +
labs(x = "",
    y = "LDA SCORE (log 10)",
    fill = "Associated\ngroup") +
theme(legend.position = "top") +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 5.2),
    expand = c(0, 0)) +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_blank(),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5))
# Heatmap
heatmap <- ggplot(data = table_heatmap,
    aes(x = reorder(variable, -order),
    y = sample,
    fill = value)) +
geom_tile() +
theme_test() +
coord_flip() +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
facet_grid(~group,
    scales = "free") +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_text(size = 7,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6))
# Pdf
pdf(file = "gut_barplot.pdf", width = 5, height = 6.5)
print(barplot)
dev.off()
pdf(file = "gut_heatmap.pdf", width = 7, height = 6.68)
print(heatmap)
dev.off()


#library(reshape)
#
#table_heatmap <- read.table(file = "./gut_lefse_taxa_heatmap_samples.txt",
#    sep = "\t", header = T)
#
#table_heatmap <- melt(table_heatmap, id=c("sample","group"))
#
#write.table(table_heatmap,
#    file = "./gut_lefse_taxa_heatmap_samples.txt",
#    quote = FALSE,
#    row.names = FALSE,
#    sep = "\t")
#