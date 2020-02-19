# set working directory to local directory where the data is kept
setwd("~/IGIDR/Development Economics - MIT/Homework Assignment 01")

# read the data
wb_dev_ind = read.csv("/Users/sarad/Desktop/MicroMasters-MITx-DEDP/ELECTIVE/14.740x/Introduction/Homework1.csv")
# summarize data
summary(wb_dev_ind)

# Question 1
# What is the Mean of GDP per capita? What is the standard deviation of GDP per capita?
meanGDPperCapita = mean(wb_dev_ind$gdp_per_capita, na.rm = TRUE)
print(round(meanGDPperCapita))
sdGDPperCapita = sd(wb_dev_ind$gdp_per_capita, na.rm = TRUE)
print(round(sdGDPperCapita))

# Question 2
# What is the mean illiteracy rate across all countries? What is the standard deviation? 
illiteracy_all = numeric(nrow(wb_dev_ind))
wb_dev_ind$illiteracy_all = illiteracy_all
wb_dev_ind$illiteracy_all = 100 - wb_dev_ind$literacy_all
meanIlliteracy = mean(wb_dev_ind$illiteracy_all, na.rm = TRUE)
print(round(meanIlliteracy))
sdIlliteracy = sd(wb_dev_ind$illiteracy_all, na.rm = TRUE)
print(round(sdIlliteracy))

# Question 3
# What is the mean infant mortality rate across all countries? What is the standard deviation?
meanInfantMortality = mean(wb_dev_ind$infant_mortality, na.rm = TRUE)
print(round(meanInfantMortality))
sdInfantMortality = sd(wb_dev_ind$infant_mortality, na.rm = TRUE)
print(round(sdInfantMortality))

# Question 4
# What is the mean male illiteracy rate? What is the mean female illiteracy rate?
illiteracy_male = numeric(nrow(wb_dev_ind))
wb_dev_ind$illiteracy_male = illiteracy_male
wb_dev_ind$illiteracy_male = 100 - wb_dev_ind$literacy_male
meanIlliteracyMale = mean(wb_dev_ind$illiteracy_male, na.rm = TRUE)
print(round(meanIlliteracyMale))
sdIlliteracyMale = sd(wb_dev_ind$illiteracy_male, na.rm = TRUE)
print(round(sdIlliteracyMale))
illiteracy_female = numeric(nrow(wb_dev_ind))
wb_dev_ind$illiteracy_female = illiteracy_female
wb_dev_ind$illiteracy_female = 100 - wb_dev_ind$literacy_female
meanIlliteracyFemale = mean(wb_dev_ind$illiteracy_female, na.rm = TRUE)
print(round(meanIlliteracyFemale))
sdIlliteracyFemale = sd(wb_dev_ind$illiteracy_female, na.rm = TRUE)
print(round(sdIlliteracyFemale))

# Question 5
# What are the mean, minimum, and maximum illiteracy rate among the 50 richest countries
richest50 = wb_dev_ind[order(wb_dev_ind$gdp_per_capita, decreasing = TRUE),][1:50,]
summary(richest50)

# Question 6
# What are the mean, minimum, and maximum illiteracy rate among the 50 poorest countries? 
poorest50 = wb_dev_ind[order(wb_dev_ind$gdp_per_capita),][1:50,]
summary(poorest50)

#  Question 7
# What are the mean, minimum, and maximum infant mortality rate among the 50 richest countries? 
summary(richest50)

# Question 8
# What are the mean, minimum, and maximum infant mortality rate among the 50 poorest countries? 
summary(poorest50)

# Question 9
# What is the median GDP per capita?
summary(wb_dev_ind)

# Question 10-12
# Regress the infant mortality rate on per capita GDP, and then answer questions 10-12
model1 = lm(infant_mortality ~ gdp_per_capita, data = wb_dev_ind)
summary(model1)

# Question 13
# Regress the illiteracy rate on GDP per capita. Is the coefficient on per capita GDP significantly different from zero at the 5% level?
model2 = lm(illiteracy_all ~ gdp_per_capita, data = wb_dev_ind)
summary(model2)

# Question 14
# Regress the infant mortality rate on the illiteracy rate. Graph a scatter plot of the data as well as the regression line. 
model3 = lm(infant_mortality ~ illiteracy_all, data = wb_dev_ind)
summary(model3)
plot(wb_dev_ind$illiteracy_all, wb_dev_ind$infant_mortality)
abline(model3)
