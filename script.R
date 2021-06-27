rm(list=ls()) # get rid of all previously stored data
library(ggplot2)

alz_data <- read.csv(".//data/oasis_cross-sectional.csv", header = TRUE) # load data
str(alz_data)
summary(alz_data)