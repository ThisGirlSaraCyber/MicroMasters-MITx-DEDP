install.packages('tabulizer')
library(tabulizer)
install.packages('dplyr')
library(dplyr)
install.packages('stringr')
library(stringr)

WorldReport2012Table1 <- 'http://siteresources.worldbank.org/INTWDR2012/Resources/7778105-1299699968583/7786210-1315936222006/Complete-Report.pdf'
WorldReport2012Table1Part1 <- extract_tables(WorldReport2012Table1, pages = 418)
WorldReport2012Table1Part2 <- extract_tables(WorldReport2012Table1, pages = 419)
WorldReport2012Table1Part1 <- do.call(rbind, WorldReport2012Table1Part1)
WorldReport2012Table1Part2 <- do.call(rbind, WorldReport2012Table1Part2)
WorldReport2012Table1Part1 <- as.data.frame(WorldReport2012Table1Part1[8:nrow(WorldReportTable12012Part1), ])
WorldReport2012Table1Part2 <- as.data.frame(WorldReport2012Table1Part2[8:nrow(WorldReportTable12012Part2), ])
WorldReport2012Table1 <- rbind(WorldReport2012Table1Part1, WorldReport2012Table1Part2)

install.packages("xlsx")
library(xlsx)
write.xlsx(WorldReport2012Table1, file = "WorldReport2012Table1.xlsx",
           sheetName = "Table1", append = FALSE)
# Add a new data set in a new worksheet
#write.xlsx(sheetnewname, file = "WorldReport2012Table1.xlsx", 
#           sheetName="secondsheetnewname", append=TRUE)
library(readxl)
WorldReport2012Table1 <- read_excel("WorldReport2012Table1.xlsx", 
                              sheet = "Table1")
library(readxl)
WorldReport2012Table1 <- read_excel("WorldReport2012Table1.xlsx", 
                              sheet = "Table1", col_types = c("numeric", 
                                                              "text", "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric", 
                                                              "numeric", "numeric", "numeric"))
View(WorldReport2012Table1)

WorldReport2012Table1[which.max(WorldReport2012Table1$Population_millions_2010),2]