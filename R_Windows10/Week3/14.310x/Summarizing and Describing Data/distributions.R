#################################################################################################
                            #Start
#################################################################################################
# Summarizing and Describing Data 
# 11 lectures & exercises 
# 1 ppt 
# 1 R script (distributions.R)
# 2 csv files (india & us)
# analyzing data, comparing india vs us, creating pdfs of graphs, using KDE & CDF

#################################################################################################
                              #Environment
#################################################################################################


# clear up environment
ls()
rm(list = ls())


#################################################################################################
                              #Library
#################################################################################################


# set the library with the packages we use
library(ggplot2)
library(tidyverse)
require(cowplot)


#################################################################################################
                              #Bihar
#################################################################################################


# create dataframe
bihar_data <- read_csv("Week3/14.310x/data/Bihar_sample_data.csv")

# print data in console
print(bihar_data)

# keep only adult females
bihar_adult_females <- filter(bihar_data, adult==1,female==1) 

# print data in console 
print(bihar_adult_females)

# drop female and adult column since it will always be true
bihar_adult_females <- bihar_data[c(T,F,F,T,T,T)]

# print data in console
print(bihar_adult_females)

# default histogram in ggplot
ggplot(bihar_adult_females, aes(height_cm))+
  geom_histogram()
ggsave("Week3/14.310x/data/output/bihar_raw.pdf")

# some people look like they are very small: filtering
bihar_adult_females_trunc <- filter(bihar_adult_females, height_cm>120, height_cm<200)

# plotting again, with a nicer label, and some color 
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="blue", color="darkblue")+
  xlab("Height in centimeters, Bihar Females")
ggsave("Week3/14.310x/data/output/bihar_better.pdf")

# playing with bins 
bihar1 <- ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="blue", color="darkblue", binwidth = 1)+
  xlab("bin width=5")+
  ylab("")

bihar2 <- ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="blue", color="darkblue", binwidth = 10)+
  xlab("bin width=10")+
  ylab("")

bihar3 <- ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="blue", color="darkblue", binwidth = 20)+
  xlab("bin width=20")+
  ylab("")

bihar4 <- ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="blue", color="darkblue", binwidth = 50)+
  xlab("bin width=50")+
  ylab("")

plot_grid(bihar1, bihar2, bihar3, bihar4, labels =c("Female Height in Bihar"), label_size = 12, hjust=0, vjust=0.2) + 
  theme(plot.margin = margin(10, 10, 10, 25))
ggsave("Week3/14.310x/data/output/bihargrid.pdf")


#################################################################################################
                              #US Data
#################################################################################################


# US Data from National Health and Nutrition Examination Survey
us_data <- read_csv("Week3/14.310x/data/US_sample_data.csv")

# print data in console 
print(us_data)

# subset the data for adult females
us_adult_females_trunc <- filter(us_data,female==1 , adult==1, height_cm>120 , height_cm<200) 

# print data in console
print(us_adult_females_trunc)

# drop female and adult column since it will always be true
us_adult_females_trunc <- us_data[c(T,T,F,F,T,T,T)]

# print data in console
print(us_adult_females_trunc)

# plotting the US women in one go
ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(fill="red", color="darkred")+
  xlab("Height in centimeters, US females")
ggsave("Week3/14.310x/data/output/US_better.pdf")

# kernel density estimation
ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="white" , color="darkred")+
  geom_density(kernel="gaussian", aes(height_cm))
ggsave("Week3/14.310x/data/output/US_kernel.pdf")

# playing with the bandwidth
US1 <- ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="white" , color="darkred")+
  geom_density(kernel="gaussian", aes(height_cm), bw=1)+
  xlab("bw=1")+
  ylab("")

US2 <- ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="white" , color="darkred")+
  geom_density(kernel="gaussian", aes(height_cm), bw=5)+
  xlab("bw=5")+
  ylab("")

US3 <- ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="white" , color="darkred")+
  geom_density(kernel="gaussian", aes(height_cm), bw=10)+
  xlab("bw=10")+
  ylab("")

US4 <- ggplot(us_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="white" , color="darkred")+
  geom_density(kernel="gaussian", aes(height_cm), bw=20)+
  xlab("bw=20")+
  ylab("")

plot_grid(US1, US2, US3, US4, labels=c("Female Height in the US"), label_size = 12,hjust=-1, vjust=0.2) +
  theme(plot.margin = margin(10, 10, 10, 25))
ggsave("Week3/14.310x/data/output/US_kerneltries.pdf")

# combining the two histograms
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=bihar_adult_females_trunc, aes(height_cm),fill="blue", color="darkblue" )+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm), fill="red", color="darkred" )

# makes no sense to do it as count! 
# when you want to compare two options, comparing the proportions makes more sense, hence we use density
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_histogram(data=bihar_adult_females_trunc, aes(height_cm, ..density.. ),fill="blue", color="darkblue")+
  geom_histogram(data=us_adult_females_trunc, aes(height_cm , ..density..), fill="red", color="darkred" )+
  xlab("Height in centimeters")

# more visible as points 
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_freqpoly(data=bihar_adult_females_trunc, aes(height_cm, ..density.. ), color="darkblue" )+
  geom_freqpoly(data=us_adult_females_trunc, aes(height_cm , ..density..),  color="darkred" )+
  xlab("Height in centimeters")
ggsave("Week3/14.310x/data/output/comparehistograms.pdf")

# kernel density
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  geom_density(data=bihar_adult_females_trunc, aes(height_cm), color="darkblue" )+
  geom_density(data=us_adult_females_trunc, aes(height_cm),  color="darkred" )+
  xlab("Height in centimeters")
ggsave("Week3/14.310x/data/output/heightkernel.pdf")

# representing the CDF
# when comparing two things, using CDF is preferred 
# the CDF is the integral of the density
# the CDF counts the number of observations, or the fraction of observations, that are lower than a particular point
# comparing the height of the two 
# you can get the numerical value at x = 150 what is the height in cm 
ggplot(bihar_adult_females_trunc, aes(height_cm))+
  stat_ecdf(data=bihar_adult_females_trunc, aes(height_cm), color="darkblue" )+
  stat_ecdf(data=us_adult_females_trunc, aes(height_cm),  color="darkred" )+
  xlab("Height in centimeters")
ggsave("Week3/14.310x/data/output/heightcdf.pdf")


#################################################################################################
                            #End
#################################################################################################