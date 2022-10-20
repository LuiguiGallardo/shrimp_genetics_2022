#!/usr/bin/env Rscript
## Purpose of script: heatmap
## Date created: 24.05.2021
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("ggpubr")
#install.packages("svglite")
library(dplyr)
library(ggplot2)
library(gridExtra)
library(reshape)
library(svglite)

# Data input
table <- read.table(file = "./allsamples_probiotics_heatmap_log10.txt",
    sep = "\t",
    header = T,
    check.names = FALSE)

table <- melt(table, id=c("sample","group"))

table$group <- factor(table$group, levels = c("Hep Gen1", "Hep Gen2",
    "Gut Gen1", "Gut Gen2",
    "Gut healthy", "Gut diseased"))

# Heatmap
heatmap <- ggplot(data = table,
    aes(x = sample,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
scale_y_discrete(limits = rev(levels(table$variable))) +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
facet_grid(~group,
    scales = "free") +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 75,
        hjust = 1),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6),
    strip.text.x = element_text(size = 8))

# Pdf
pdf(file = "allsamples_probiotics_heatmap_log10.pdf")
print(heatmap)
dev.off()

# Svg
ggsave("allsamples_probiotics_heatmap_log10.svg")
print(heatmap)
dev.off()

# Only hepatopancreas

table_hep <- filter(table, group == "Hep Gen1" | group == "Hep Gen2")

# Heatmap
heatmap <- ggplot(data = table_hep,
    aes(x = sample,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
scale_y_discrete(limits = rev(levels(table_hep$variable))) +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
facet_grid(~group,
    scales = "free") +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 75,
        hjust = 1),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6),
    strip.text.x = element_text(size = 8))

# Pdf
pdf(file = "hep_probiotics_heatmap_log10.pdf")
print(heatmap)
dev.off()

# Svg
ggsave("hep_probiotics_heatmap_log10.svg")
print(heatmap)
dev.off()

# Only Gut genetics

table_gut <- filter(table, group == "Gut Gen1" | group == "Gut Gen2")

# Heatmap
heatmap <- ggplot(data = table_gut,
    aes(x = sample,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
scale_y_discrete(limits = rev(levels(table_gut$variable))) +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
facet_grid(~group,
    scales = "free") +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 75,
        hjust = 1),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6),
    strip.text.x = element_text(size = 8))

# Pdf
pdf(file = "gut_probiotics_heatmap_log10.pdf")
print(heatmap)
dev.off()

# Svg
ggsave("gut_probiotics_heatmap_log10.svg")
print(heatmap)
dev.off()

# Only Gut health status

table_health <- filter(table, group == "Gut healthy" | group == "Gut diseased")

# Heatmap
heatmap <- ggplot(data = table_health,
    aes(x = sample,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
scale_y_discrete(limits = rev(levels(table_health$variable))) +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
facet_grid(~group,
    scales = "free") +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 75,
        hjust = 1),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6),
    strip.text.x = element_text(size = 8))

# Pdf
pdf(file = "health_probiotics_heatmap_log10.pdf")
print(heatmap)
dev.off()

# Svg
ggsave("health_probiotics_heatmap_log10.svg")
print(heatmap)
dev.off()

# Only all guts

table_all_guts <- filter(table, group == "Gut Gen1" | group == "Gut Gen2" | group == "Gut healthy" | group == "Gut diseased")

# Heatmap
heatmap <- ggplot(data = table_all_guts,
    aes(x = sample,
    y = variable,
    fill = value)) +
geom_tile() +
theme_test() +
scale_y_discrete(limits = rev(levels(table_all_guts$variable))) +
scale_fill_distiller(palette = "YlOrRd",
    direction = 1) +
theme(legend.position = "top") +
labs(x = "",
    y = "",
    fill = "log10 (relative\nabundance)") +
facet_grid(~group,
    scales = "free") +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 75,
        hjust = 1),
    axis.text.y = element_text(size = 8,
        vjust = 0.25),
    legend.title = element_text(size = 10,
        vjust = 1, hjust = 0.5),
    legend.text = element_text(size = 6),
    strip.text.x = element_text(size = 8))

# Pdf
pdf(file = "allgut_probiotics_heatmap_log10.pdf")
print(heatmap)
dev.off()

# Svg
ggsave("allgut_probiotics_heatmap_log10.svg")
print(heatmap)
dev.off()