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