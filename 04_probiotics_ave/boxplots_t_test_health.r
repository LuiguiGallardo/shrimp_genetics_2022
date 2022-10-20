#!/usr/bin/env Rscript
## Purpose of script: Boxplot with t_test test
## Last modification: 31.05.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

# Package installation
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("ggpubr")
library("dplyr")
library("ggplot2")
library("ggpubr")

# Genus
# Data input
table_health_genus <- read.table(file = "./health_probiotics_genus.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Define colors
colors <- c("darkviolet", "mediumseagreen")

# Boxplot
p_value <- list(c("i-sano", "i-enfermo"))
boxplot <- ggplot(table_health_genus, 
    aes(x = group,
    y = average)) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Relative abundance",
    title = "health probiotics (genus)") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "t.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))

# Creation of pdf
pdf(file = "health_probiotics_genus_t_test.pdf")
    print(boxplot)
dev.off()

# Specie
# Data input
table_health_specie <- read.table(file = "./health_probiotics_specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Define colors
colors <- c("darkviolet", "mediumseagreen")

# Boxplot
p_value <- list(c("i-sano", "i-enfermo"))
boxplot <- ggplot(table_health_specie, 
    aes(x = group,
    y = average)) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Relative abundance",
    title = "health probiotics (specie)") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "t.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))

# Creation of pdf
pdf(file = "health_probiotics_specie_t_test.pdf")
    print(boxplot)
dev.off()

# Genus-specie
# Data input
table_health_genus_specie <- read.table(file = "./health_probiotics_genus-specie.txt",
    sep = '\t',
    header = TRUE,
    row.names = 1)

# Define colors
colors <- c("darkviolet", "mediumseagreen")

# Boxplot
p_value <- list(c("i-sano", "i-enfermo"))
boxplot <- ggplot(table_health_genus_specie, 
    aes(x = group,
    y = average)) +
geom_boxplot(aes(color = group),
    outlier.shape = NA) +
geom_point(aes(color = group),
    size = 2,
    shape = 21,
    position = position_jitterdodge()) +
theme_test() +
theme(legend.position = "none") +
labs(x = "",
    y = "Relative abundance",
    title = "health probiotics (genus_specie)") +
scale_color_manual(values = colors) +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24)) +
stat_compare_means(comparisons = p_value,
    method = "t.test") +
theme(text = element_text(size = 24),
    axis.title.y = element_text(size = 24))

# Creation of pdf
pdf(file = "health_probiotics_genus_specie_t_test.pdf")
    print(boxplot)
dev.off()