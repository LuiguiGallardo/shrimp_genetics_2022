#!/usr/bin/env Rscript
## Purpose of script: niche breadht barplot
## Date created: 23.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
# Package installation
#install.packages("vegan")
#install.packages("ggplot2")
#install.packages("ggrepel")
#install.packages("ggpubr")
library("vegan")
library("ggplot2")
library("ggrepel")
library("ggpubr")
# Data input
table <- as.dist(read.table(file = "unweighted_unifrac_dm_all-samples.txt",
    header = 1, 
    row.names = 1,
    sep = "\t"))
# Define colors and variables
name <- (labels = c("HL7", "HE8", "HL5", "HL4", "HL2", "HL1", "HE4", "HE5", 
                    "HE7", "HE1", "HE2", "IE3", "IE2", "IE5", "IE7", "HA8", 
                    "IA9", "IA8", "IA5", "HA1", "IA7", "HA5", "IA3", "IA2", 
                    "IE9", "IE8", "IA4", "HA2", "IL6", "IL4", "IL2", "IL3", 
                    "IL1", "HA7", "IL8"))
organ <- (labels = c("Hepatopancreas", "Hepatopancreas", "Hepatopancreas", "Hepatopancreas", 
                     "Hepatopancreas", "Hepatopancreas", "Hepatopancreas", "Hepatopancreas", 
                     "Hepatopancreas", "Hepatopancreas", "Hepatopancreas", "Gut", "Gut", "Gut", 
                     "Gut", "Hepatopancreas", "Gut", "Gut", "Gut", "Hepatopancreas", "Gut", "Hepatopancreas", 
                     "Gut", "Gut", "Gut", "Gut", "Gut", "Hepatopancreas", "Gut", "Gut", "Gut", "Gut", "Gut", 
                     "Hepatopancreas", "Gut"))
p_value <- list(c("Gut", "Hepatopancreas"))
colors <- c("darkviolet", "mediumseagreen")
# Betadisper
organ_bdisp <- betadisper(table,
    organ,
    type = c("median"))
organ_df <- data.frame(Distance_to_centroid=organ_bdisp$distances,
    Group = organ_bdisp$group)
# Boxplot
boxplot <- ggplot(organ_df,
    aes(x = Group,
    y = Distance_to_centroid)) +
geom_boxplot(aes(color = Group),
    outlier.shape = NA) +
geom_point(aes(color = Group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Distance to centroid") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "wilcox.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))
# Creation of pdf
pdf(file = "distance_centroid_organs.pdf")
print(boxplot)
dev.off()