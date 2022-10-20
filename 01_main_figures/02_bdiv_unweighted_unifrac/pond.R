#!/usr/bin/env Rscript
## Purpose of script: beta diversity pcoa plot
## Date created: 13.07.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)

#Installation of packages
#install.packages('optparse')
library("ggplot2")

#Data input
data <- read.table(file = "pcoa_data.txt",
    header = TRUE,
    sep = '\t')

group = data$Pond

#Define colors
colors <- c( "royalblue", "darkgreen", "orangered")

#Define shapes
shapes <- c(15, 16, 17)

# Creation of the graph
theme_set(theme_bw())
graph <- ggplot(data, aes(y = pc2.0.18351911740638438., x = pc3.0.07089508464704075.)) +
geom_point(aes(col=group,
    shape=group),
    size = 3) +
scale_color_manual(values = colors) +
scale_shape_manual(values = shapes) +
labs(x="PC3 (7.09%)", 
    y="PC2 (18.35%)",
    title = "ANOSIM=0.1185; p-value=0.006") +
geom_hline(yintercept=0,
    color = "gray") +
geom_vline(xintercept=0,
    color = "gray") +
  theme(legend.title = element_blank(),
        legend.position = c(0.135, 0.945),
        legend.background = element_blank(),
        legend.text = element_text(size=17),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        axis.title.x = element_text(size = 17),
        axis.title.y = element_text(size = 17),
        plot.title = element_text(hjust = 0.5,
                                  size = 17))

#Plot pdf
pdf(file = "pond.pdf")
graph
dev.off()
