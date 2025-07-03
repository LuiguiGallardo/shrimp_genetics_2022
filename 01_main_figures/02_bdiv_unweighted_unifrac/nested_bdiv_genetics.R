# Script: Nested PERMANOVA and ANOSIM Analysis
# Description: This script performs a nested PERMANOVA and ANOSIM analysis to evaluate the effects of genetics and ponds 
#              (nested within genetics) on beta diversity using a distance matrix and associated metadata.
# Author: Luigui
# Date: March 17, 2025

library(vegan)
library(optparse)
library(BiodiversityR)

# Define command-line options
option_list <- list(
  make_option(c("-i", "--input"), type="character", default=NULL, 
              help="Path to the distance matrix file", metavar="character"),
  make_option(c("-m", "--metadata"), type="character", default=NULL, 
              help="Path to the metadata file", metavar="character"),
  make_option(c("-o", "--output"), type="character", default="adonis_results.txt", 
              help="Path to the output file [default: %default]", metavar="character"),
  make_option(c("-t", "--formula"), type="character", default="Genetic + Pond", 
              help="Formula for the PERMANOVA analysis [default: %default]", metavar="character")
)

# Parse command-line arguments
opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# Check if required arguments are provided
if (is.null(opt$input) || is.null(opt$metadata)) {
  stop("Both -i (input distance matrix) and -m (metadata) parameters are required.")
}

# Load distance matrix
dist_matrix <- as.dist(read.table(opt$input))

# Validate the distance matrix
if (any(as.matrix(dist_matrix) < 0)) {
  stop("The distance matrix contains negative values. Please provide a valid distance matrix.")
}

# Load metadata
metadata <- read.table(opt$metadata, header=TRUE, sep="\t", row.names=1)

perm <- how(complete = TRUE, 
            within   = Within(type = "none"),
            plots    = with(metadata, Plots(strata = Organ, type = "free")))

# Run nested PERMANOVA with the specified formula
adonis_results <- adonis2(dist_matrix ~ Organ + Genetic, data=metadata, permutations=perm)
print(adonis_results)
# Save PERMANOVA results to output file
write.table(adonis_results, file=opt$output, sep="\t", quote=FALSE, col.names=NA)

# Global ANOSIM: Test for differences between Genetic groups
# anosim_global <- anosim(dist_matrix, grouping = metadata$Genetic, permutations = 999)
# print(anosim_global)

# # Nested ANOSIM: Test within each Genetic group
# anosim_nested <- lapply(unique(metadata$Genetic), function(genetic_group) {
#   # Subset metadata and distance matrix for each Genetic group
#   subset_idx <- metadata$Genetic == genetic_group
#   dist_subset <- as.dist(dist_matrix[subset_idx, subset_idx])
  
#   # Run ANOSIM for Pond within each Genetic group
#   anosim(dist_subset, grouping = metadata$Pond[subset_idx], permutations = 999)
# })

# # Print results for each nested comparison
# names(anosim_nested) <- unique(metadata$Genetic)
# lapply(anosim_nested, print)

# # Append ANOSIM results to the output file
# cat("\n# Nested ANOSIM Results\n", file=opt$output, append=TRUE)
# cat("R\tSignificance\tPermutations\n", file=opt$output, append=TRUE)
# cat(anosim_results$statistic, "\t", anosim_results$signif, "\t", anosim_results$permutations, "\n", 
#     file=opt$output, append=TRUE)

# cat("Nested PERMANOVA and ANOSIM analysis completed. Results saved to:", opt$output, "\n")