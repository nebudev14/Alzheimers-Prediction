rm(list=ls()) # get rid of all previously stored data
library(ggplot2)

alz_data <- read.csv(".//data/oasis_cross-sectional.csv", header = TRUE) # load data
str(alz_data)
summary(alz_data)
head(alz_data)

nrow(alz_data)

# get all NA values
sum(is.na(alz_data))

alz_data_nonNA <- alz_data[complete.cases(alz_data), ] # omit all NA values

# pie chart of all people with some CDR level
ggplot(alz_data_nonNA, aes(x="", y=nrow(alz_data_nonNA), fill=as.factor(CDR))) + 
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) 

