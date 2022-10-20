#!/usr/bin/env Rscript
## Purpose of script: heatmap
## Date created: 24.05.2021
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("ggpubr")
library("dplyr")
library("ggplot2")
library("gridExtra")
library("reshape")

# Data input
table <- read.table(file = "./gut_probiotics_heatmap.txt",
    sep = "\t", header = T)

table <- melt(table, id=c("group","order"))

# Heatmap
heatmap <- ggplot(data = table,
    aes(x = group,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
coord_flip() +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
theme(text = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6))
# Pdf
pdf(file = "gut_probiotics_heatmap.pdf")
print(heatmap)
dev.off()