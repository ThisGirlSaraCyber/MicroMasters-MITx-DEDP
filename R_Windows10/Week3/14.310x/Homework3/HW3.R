#Preliminaries
rm(list=ls())
library("utils")
library("tidyverse")

# import the dataset 
gender_stats <- read.csv("Week3/14.310x/Homework3/Gender_StatsData.csv", header = TRUE)
gender_data <- as_tibble(read.csv("Week3/14.310x/Homework3/Gender_StatsData.csv"))
gender_data <- as_tibble(read.csv("Week3/14.310x/Homework3/Gender_StatsData_F.csv"))
# equivalent base-R function is subset()
teenager_fr <- filter(gender_stats, Indicator.Code == "SP.ADO.TFRT") 

# check data 
gender_data

# MANIPULATING THE DATA
# the sample mean of the Adolescent Fertility Rate in 1975
mean(teenager_fr$X2000, na.rm = TRUE)
sd(teenager_fr$X2000, na.rm = TRUE)

# Use the dplyr filter() command and the logical %in% to keep only the relevant Country.Code observations in teenager_fr
byincomelevel <- filter(teenager_fr,Country.Code%in%c("LIC","MIC","HIC", "WLD")) 

# Suppose you decide you prefer to have one observation per income group and year
# The dplyr command gather() 
plotdata_bygroupyear <- gather(byincomelevel, Year, FertilityRate, X1960:X2015) %>%
  select(Year, Country.Name, Country.Code, FertilityRate)
# Suppose you prefer to look at the data at the year level and have the fertility rates for each income-group as separate variables
# The dplyr command spread()
plotdata_byyear <- select(plotdata_bygroupyear, Country.Code, Year, FertilityRate) %>%
  spread(Country.Code, FertilityRate) 

# plot it 
ggplot(plotdata_bygroupyear, aes(x = Year , y = FertilityRate, group = Country.Code)) + geom_line()

plotdata_bygroupyear <- mutate(plotdata_bygroupyear, Year=as.numeric(str_sub(Year,2,5)))

# HW_3_18-23.R
#Generating histdata_twoyears
histdata_twoyears <- select(teenager_fr, Country.Name, Country.Code, Indicator.Name, Indicator.Code, X1960,X2000)

histdata_twoyears <- gather(teenager_fr, Year, FertilityRate, X1960, X2000) %>%
  select(Year, Country.Name, Country.Code, FertilityRate)

histdata_twoyears <- filter(histdata_twoyears,!is.na(FertilityRate))

ggplot(histdata_twoyears, aes(x=FertilityRate)) + 
  geom_histogram(data=subset(histdata_twoyears, Year=="X1960"), 
                 color="darkred", fill="red", alpha=0.2) + 
  geom_histogram(data=subset(histdata_twoyears, Year=="X2000"), 
                 color="darkblue", fill="blue", alpha=0.2) 
ggsave("hist.png")

#Question 20
ggplot(histdata_twoyears, aes(x=FertilityRate, group=Year, color=Year, alpha=0.2)) +
  geom_histogram(aes(y=..density..)) +
  geom_density(data=subset(histdata_twoyears, Year=="X1960"), color="darkred", fill="red", alpha=0.2, bw=5)+ 
  geom_density(data=subset(histdata_twoyears, Year=="X2000"), color="darkblue", fill="blue", alpha=0.2, bw=5)
ggplot(histdata_twoyears, aes(x=FertilityRate, group=Year, color=Year, alpha=0.2)) +        geom_histogram(aes(y=..density..)) +
  geom_density(data=subset(histdata_twoyears, Year=="X1960"), color="darkred", fill="red", alpha=0.2, bw=5)+
  geom_density(data=subset(histdata_twoyears, Year=="X2000"), color="darkblue", fill="blue", alpha=0.2, bw=5)



#Preliminaries
#---------------------------------------
rm(list=ls())
library("utils")
#install.packages('plot3D')
library(plot3D)

#Creating the vector x and y
M <- mesh(seq(0,1,length=100), seq(0,1,length=100))
x<-M$x
y<-M$y 
z<-6/5*(M$x+M$y^2)

#Plotting this pdf
persp3D(x, y, z, xlab='X variable', ylab= 'Y variable', xlim = c(0,1), main= "Plotting joint pdf")