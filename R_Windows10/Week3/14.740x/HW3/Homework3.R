#HW3
install.packages("dummies")
install.packages("AER")

library(dummies)
library(AER)

inpres = read.csv('Week3/14.740x/data/inpres_data_corrected.csv')
summary(inpres)
str(inpres)
plot(inpres$education, inpres$log_wage)

model1 = glm(log_wage ~ education, data = inpres)
summary(model1)

inpres$treated = ifelse(inpres$birth_year >= 68, 1, 0)
summary(inpres$treated>0)
youngerinpres <-as.numeric(inpres$treated, rm="0")
mean(youngerinpres)

mean(inpres$treated, na.rm=1)

summary(inpres)

# Run a regression of log monthly earnings on education. What is the estimated impact of an extra year of education on log monthly earnings?
summary(lm(log_wage~education, data=inpres))

parsedinpres <- filter(inpres, birth_year >= 68)
summary(parsedinpres)



older <- inpres[inpres$treated == 0,]
older_control <- older[older$high_intensity == 0,]
older_treated <- older[older$high_intensity == 1,]
summary(older)
summary(older_control)
summary(older_treated)
mean(older_treated$education, na.rm=0)

younger <- inpres[inpres$treated == 1,]
younger_control <- younger[younger$high_intensity == 0,]
younger_treated <- inpres[younger$high_intensity == 1,]
summary(younger)
summary(younger_control)
summary(younger_treated)
mean(younger_treated$education, na.rm=0)
mean(younger_control$education, na.rm=0)


################ Sample R Code Provided after due date

install.packages("dummies")
install.packages("AER")
library(dummies)
library(AER)


# Set workspace
setwd("...")


# Read in the data
data <- read.csv("Week3/14.740x/data/inpres_data_corrected.csv")


# OLS regression
summary(lm(log_wage~education, data=data))


# DD Tables: Education
data$exposed <- data$birth_year>=68
mean(data[data$high_intensity==0&data$exposed==FALSE,"education"])
mean(data[data$high_intensity==0&data$exposed==TRUE,"education"])
mean(data[data$high_intensity==1&data$exposed==FALSE,"education"])
mean(data[data$high_intensity==1&data$exposed==TRUE,"education"])


# DD Tables: Wages
mean(data[data$high_intensity==0&data$exposed==FALSE,"log_wage"])
mean(data[data$high_intensity==0&data$exposed==TRUE,"log_wage"])
mean(data[data$high_intensity==1&data$exposed==FALSE,"log_wage"])
mean(data[data$high_intensity==1&data$exposed==TRUE,"log_wage"])


# DD by regression
data$exp_int <- data$exposed*data$high_intensity
summary(lm(education~exp_int+exposed+high_intensity, data=data))
summary(lm(log_wage~exp_int+exposed+high_intensity, data=data))
# Q10
# Run the DD regressions for estimating the impact of the program on education. 
# Run the DD regression for estimating the impact of the program on log earnings. 
# Using the resulting output, 
# what is the Wald estimate of the effect of education on log earnings, using INPRES exposure as the instrument?
round(0.001172/0.07636, digits = 3)

# IV version
summary(ivreg(log_wage~education+exposed+high_intensity|exp_int+exposed+high_intensity, data=data))


# Better instrument and controls
rgns <- dummy(data$birth_region)
byrs <- dummy(data$birth_year)
ivdat <- data.frame(rgns,byrs)
ivdat$log_wage <- data$log_wage
ivdat$education <- data$education
ivdat$exp_nsch <- data$exposed * data$num_schools
ivdat$ch_exp <- data$children71 * data$exposed

# IV Regression
summary(ivreg(log_wage~.-exp_nsch|.-education,data=ivdat))
