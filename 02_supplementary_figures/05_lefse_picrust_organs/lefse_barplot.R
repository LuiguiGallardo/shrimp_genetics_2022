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
table <- read.table(file = "organ_lefse_picrust_l2.txt",
    sep = "\t", header = T)
# Define colors
colors <- c("darkviolet", "mediumseagreen")
# Barplot
barplot <- ggplot(data = table,
    aes(x = reorder(organ_function, -order),
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
scale_y_continuous(limits = c(0, 3.2),
    expand = c(0, 0)) +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_text(size = 15),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5))
# Pdf
pdf(file = "organ_barplot_picrust_l2.pdf")
print(barplot)
dev.off()

table <- read.table(file = "organ_lefse_picrust_l3.txt",
    sep = "\t", header = T)
# Define colors
colors <- c("darkviolet", "mediumseagreen")
# Barplot
barplot <- ggplot(data = table,
    aes(x = reorder(organ_function, -order),
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
scale_y_continuous(limits = c(0, 3.2),
    expand = c(0, 0)) +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5))
# Pdf
pdf(file = "organ_barplot_picrust_l3.pdf")
print(barplot)
dev.off()

