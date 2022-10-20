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
table <- read.table(file = "organ_lefse_taxa.txt",
    sep = "\t", header = T)
#table_heatmap <- read.table(file = "organ_lefse_taxa_heatmap.txt",
#    sep = "\t", header = T)
# Define colors
colors <- c("darkviolet", "mediumseagreen")
# Barplot
barplot <- ggplot(data = table,
    aes(x = reorder(organ_taxa, -order),
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
scale_y_continuous(limits = c(0, 5),
    expand = c(0, 0)) +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_text(size = 6),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5))
# Heatmap
#heatmap <- ggplot(data = table_heatmap,
#    aes(x = reorder(organ_taxa, -order),
#    y = group,
#    fill = value)) +
#geom_tile() +
#theme_test() +
#coord_flip() +
#scale_fill_distiller(palette = "Blues",
#    direction = 1) +
#theme(legend.position = "top") +
#labs(x = "",
#    y = "",
#    fill = "Relative\nabundance") +
#theme(text = element_text(size = 12),
#    axis.title.x = element_text(size = 12),
#    axis.text.y = element_text(size = 11,
#        vjust = 0.3),
#    legend.title = element_text(size = 10,
#        vjust = 1, hjust = 0.5))
# Pdf
pdf(file = "organ_barplot.pdf")
print(barplot)
dev.off()
#pdf(file = "organ_heatmap.pdf", width = 5, height = 6.68)
#print(heatmap)
#dev.off()
