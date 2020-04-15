# source: https://murraylax.org/eco307/notes/regression_intro.pdf

download.file(
  url = "https://murraylax.org/datasets/wage2.csv",
  dest = "wage2.csv")

wages <- read.csv("wage2.csv")

plot(x = jitter(wages$YearsEdu, amount = 0/5), y=wages$MonthlyEarnings,
     main = "Monthly Earnings vs Years of Education",
     xlab = "Years of Education",
     ylab = "Monthly Earnings")

edulm <- lm(wages$MonthlyEarnings ~ wages$YearsEdu)
edulm$coefficients

plot(x = jitter(wages$YearsEdu, amount = 0/5), y=wages$MonthlyEarnings,
     main = "Monthly Earnings vs Years of Education",
     xlab = "Years of Education",
     ylab = "Monthly Earnings")
abline(edulm)

# these results imply the equation for the best fitting line is given by:
# yi= 146.95 + 60.21xi+ei,
# and the predicted value for monthly earnings for person i with xi years of education is given by:
# ^yi= 146.95 + 60.21xi