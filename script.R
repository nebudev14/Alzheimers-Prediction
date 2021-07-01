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
  ggtitle("Levels of CDR in all patients") +
  coord_polar("y", start=0) + 
  theme_void()

# bar graph of all people with some CDR level
ggplot(alz_data_nonNA, aes(x = as.factor(CDR))) +
  geom_bar(width = 0.5) + 
  ggtitle("Levels of CDR in all patients")

no_dementia <- alz_data_nonNA[which(alz_data_nonNA$CDR == 0), ] # red
mild_dementia <- alz_data_nonNA[which(alz_data_nonNA$CDR == 0.5), ] # blue
moderate_dementia <- alz_data_nonNA[which(alz_data_nonNA$CDR == 1), ] # green
severe_dementia <- alz_data_nonNA[which(alz_data_nonNA$CDR == 2), ] # orange

boxplot(no_dementia$Age, mild_dementia$Age, moderate_dementia$Age, severe_dementia$Age,
        xlab = "Age",
        col = c("red", "blue", "green", "orange"),
        horizontal=TRUE)
