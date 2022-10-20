#!/usr/bin/env Rscript
## Purpose of script: alpha diversity boxplot
## Date created: 22.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
args = commandArgs(trailingOnly=TRUE)
# Package installation
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("ggpubr")
library("dplyr")
library("ggplot2")
library("ggpubr")
# Data input
alpha_data <- read.table(file = args[1], sep = "\t", header = T)
# Define colors
colors <- c("darkviolet", "mediumseagreen")
### chao1 ###
p_value <- list(c("G1", "G2"))
boxplot <- ggplot(alpha_data, aes(x = group, y = chao1)) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Chao1 Index") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "wilcox.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))
# Creation of pdf
pdf(file = args[2])
print (boxplot)
dev.off()

### Shannon ###
p_value <- list(c("G1", "G2"))
boxplot <- ggplot(alpha_data, aes(x = group, y = shannon)) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Shannon Index") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "wilcox.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))
# Creation of pdf
pdf(file = args[3])
print (boxplot)
dev.off()
