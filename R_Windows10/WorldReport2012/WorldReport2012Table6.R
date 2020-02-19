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

WorldReport2012Table6 <- 'http://siteresources.worldbank.org/INTWDR2012/Resources/7778105-1299699968583/7786210-1315936222006/Complete-Report.pdf'
WorldReport2012Table6Part1 <- extract_tables(WorldReport2012Table6, pages = 428)
WorldReport2012Table6Part2 <- extract_tables(WorldReport2012Table6, pages = 429)
WorldReport2012Table6Part1List1 <- list.remove(WorldReport2012Table6Part1, range = 2)
WorldReport2012Table6Part2List1 <- list.remove(WorldReport2012Table6Part2, range = 2)
WorldReport2012Table6Part1 <- do.call(rbind, WorldReport2012Table6Part1List1)
WorldReport2012Table6Part2 <- do.call(rbind, WorldReport2012Table6Part2List1)
WorldReport2012Table6Part1 <- as.data.frame(WorldReport2012Table6Part1[2:nrow(WorldReport2012Table6Part1), ])
WorldReport2012Table6Part2 <- as.data.frame(WorldReport2012Table6Part2[2:nrow(WorldReport2012Table6Part2), ])
WorldReport2012Table6 <- rbind(WorldReport2012Table6Part1, WorldReport2012Table6Part2)

install.packages("xlsx")
library(xlsx)
write.xlsx(WorldReport2012Table6, file = "WorldReport2012Table6.xlsx",
           sheetName = "Table6", append = FALSE)
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