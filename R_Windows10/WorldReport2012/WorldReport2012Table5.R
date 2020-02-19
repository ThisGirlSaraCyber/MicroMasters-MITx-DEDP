install.packages('tidyverse')
library(tidyverse)
install.packages('tabulizer')
library(tabulizer)
install.packages('tabulizerjars')
library(tabulizerjars)
install.packages('dplyr')
library(dplyr)
install.packages('stringr')
library(stringr)
install.packages('rlist')
library(rlist)

WorldReport2012Table5 <- 'http://siteresources.worldbank.org/INTWDR2012/Resources/7778105-1299699968583/7786210-1315936222006/Complete-Report.pdf'
WorldReport2012Table5Part1 <- extract_tables(WorldReport2012Table5, pages = 426)
WorldReport2012Table5Part2 <- extract_tables(WorldReport2012Table5, pages = 427)
WorldReport2012Table5Part1List1 <- list.remove(WorldReport2012Table5Part1, range = 2)
WorldReport2012Table5Part2List1 <- list.remove(WorldReport2012Table5Part2, range = 2)
WorldReport2012Table5Part1 <- do.call(rbind, WorldReport2012Table5Part1)
WorldReport2012Table5Part2 <- do.call(rbind, WorldReport2012Table5Part2)
WorldReport2012Table5Part1 <- as.data.frame(WorldReport2012Table5Part1[8:nrow(WorldReport2012Table5Part1), ])
WorldReport2012Table5Part2 <- as.data.frame(WorldReport2012Table5Part2[8:nrow(WorldReport2012Table5Part2), ])
WorldReport2012Table5 <- rbind(WorldReport2012Table5Part1, WorldReport2012Table5Part2)

install.packages("xlsx")
library(xlsx)
write.xlsx(WorldReport2012Table5, file = "WorldReport2012Table5.xlsx",
           sheetName = "Table5", append = FALSE)
# Add a new data set in a new worksheet
#write.xlsx(sheetnewname, file = "WorldReport2012Table2.xlsx", 
#           sheetName="secondsheetnewname", append=TRUE)
library(readxl)
WorldReport2012Table2 <- read_excel("WorldReport2012Table2.xlsx", 
                              sheet = "Table2")
library(readxl)
WorldReport2012Table2 <- read_excel("WorldReport2012Table2.xlsx", 
                              sheet = "Table2", col_types = c("numeric", 
                                                              "text", "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric"))
View(WorldReport2012Table2)

WorldReport2012Table2[which.max(WorldReport2012Table2$Population_millions_2010),2]