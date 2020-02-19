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

WorldReport2012Table4 <- 'http://siteresources.worldbank.org/INTWDR2012/Resources/7778105-1299699968583/7786210-1315936222006/Complete-Report.pdf'
WorldReport2012Table4Part1 <- extract_tables(WorldReport2012Table4, pages = 424)
WorldReport2012Table4Part2 <- extract_tables(WorldReport2012Table4, pages = 425)
WorldReport2012Table4Part1List1 <- list.remove(WorldReport2012Table4Part1, range = 2)
WorldReport2012Table4Part2List1 <- list.remove(WorldReport2012Table4Part2, range = 2)
WorldReport2012Table4Part1 <- do.call(rbind, WorldReport2012Table4Part1)
WorldReport2012Table4Part2 <- do.call(rbind, WorldReport2012Table4Part2)
WorldReport2012Table4Part1 <- as.data.frame(WorldReport2012Table4Part1[10:nrow(WorldReport2012Table4Part1), ])
WorldReport2012Table4Part2 <- as.data.frame(WorldReport2012Table4Part2[10:nrow(WorldReport2012Table4Part2), ])
WorldReport2012Table4 <- rbind(WorldReport2012Table4Part1, WorldReport2012Table4Part2)

install.packages("xlsx")
library(xlsx)
write.xlsx(WorldReport2012Table4, file = "WorldReport2012Table4.xlsx",
           sheetName = "Table4", append = FALSE)
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