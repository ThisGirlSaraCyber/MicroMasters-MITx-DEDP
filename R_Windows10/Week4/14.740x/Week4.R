install.packages("dummies")
install.packages("AER")
install.packages("lfe")
library(lfe)
library(dummies)
library(AER)

# Read in the data
data <- read.csv("Week4/14.740x/data/tea_data_corrected.csv")

# OLS regression
summary(lm(sex~cashcrop, data=data))

