#!/usr/bin/env Rscript
## Purpose of script: taxonomy barplots
## Date created: 13.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
# Package installation
#install.packages("colorRamps")
#install.packages("ggplot2")
#install.packages("reshape")
#install.packages("devtools")
#devtools::install_github("jaredhuling/jcolors")
library("colorRamps")
library("ggplot2")
library("reshape")
library("scales")
library("jcolors")
library("grid")
library("RColorBrewer")

### Function definition ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = sample,
    y = value,
    fill = taxa)) +
facet_grid(~pond,
    scales = "free") +
labs(x = "",
    y = "Relative abundance",
    fill = toupper("phylum")) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 1.01),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 90),
    legend.title = element_text(size = 14,
        hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 1,
    byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""))
print(barplot_tax)
dev.off()
}
### PHYLUM per sample ###
barplot("phylum_sample")


### Function definition ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = pond,
    y = value,
    fill = taxa)) +
facet_grid(~organ) +
labs(x = "",
    y = "Relative abundance",
    fill = toupper(taxonomy)) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 1.01),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 15),
    axis.text.x = element_text(size = 14,
        angle = 45,
        hjust = 1),
    legend.title = element_text(size = 15,
    hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 1, byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""))
print(barplot_tax)
dev.off()
}

### PHYLUM ###
barplot("phylum")

### CLASS ###
barplot("class")

### Function re-definition for larger taxonomy ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = pond,
    y = value,
    fill = taxa)) +
facet_grid(~organ) +
labs(x = "",
    y = "Relative abundance",
    fill = toupper(taxonomy)) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 1.01),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 30,
        hjust = 1),
    legend.title = element_text(size = 14,
    hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 2, byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""))
print(barplot_tax)
dev.off()
}

### ORDER ###
barplot("order")

### Function re-definition for larger taxonomy ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = pond,
    y = value,
    fill = taxa)) +
facet_grid(~organ) +
labs(x = "",
    y = "Relative abundance",
    fill = toupper(taxonomy)) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 0.85),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 30,
        hjust = 1),
    legend.title = element_text(size = 14,
    hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 2, byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""))
print(barplot_tax)
dev.off()
}

### FAMILY ###
barplot("family")

### Function re-definition for larger taxonomy ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = pond,
    y = value,
    fill = taxa)) +
facet_grid(~organ) +
labs(x = "",
    y = "Relative abundance",
    fill = toupper(taxonomy)) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 0.58),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 15),
    axis.text.x = element_text(size = 14,
        angle = 45,
        hjust = 1),
    legend.title = element_text(size = 15,
    hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 3, byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""),
    width = 10, height = 7)
print(barplot_tax)
dev.off()
}

### GENUS ###
barplot("genus")

### Function re-definition for larger taxonomy ###
barplot <- function(taxonomy) {
# Input table #
table <- read.table(file = paste(taxonomy,
    ".txt", sep = ""),
    header = TRUE,
    sep = "\t")
colourCount = length(unique(table$taxa))
getPalette = colorRampPalette(brewer.pal(9, "Set3"))
# Plot #
barplot_tax <- ggplot(table) +
geom_col(aes(x = pond,
    y = value,
    fill = taxa)) +
facet_grid(~organ) +
labs(x = "",
    y = "Relative abundance",
    fill = toupper(taxonomy)) +
scale_x_discrete(expand = c(0, 0)) +
scale_y_continuous(limits = c(0, 0.165),
    expand = c(0, 0)) +
scale_fill_manual(values = getPalette(colourCount)) +
theme_test() +
theme(text = element_text(size = 12),
    axis.text.x = element_text(size = 8,
        angle = 30,
        hjust = 1),
    legend.title = element_text(size = 14,
    hjust = 0.5),
    legend.key.height = unit(1, "line"),
    legend.key.width = unit(1, "line")) +
guides(fill = guide_legend(ncol = 1, byrow = FALSE))
# Create .pdf #
pdf(file = paste(taxonomy, ".pdf", sep = ""))
print(barplot_tax)
dev.off()
}

### SPECIE ###
barplot("specie")
