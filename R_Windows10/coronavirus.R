# use this when encountering an error for installing packages, it resets the package
file.edit(file.path("~", ".Rprofile"))

# source: https://ramikrispin.github.io/coronavirus/
install.packages("coronavirus")
library(coronavirus)
install.packages("devtools")
library(devtools)
install.packages("usethis")
library(usethis)
devtools::install_github("covid19r/coronavirus")

data("coronavirus")

install.packages("dplyr")
library(dplyr)

summary_df <- coronavirus %>% group_by(Country.Region, type) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

summary_df %>% head(20)

library(tidyr)

coronavirus %>% 
  filter(date == max(date)) %>%
  select(country = Country.Region, type, cases) %>%
  group_by(country, type) %>%
  summarise(total_cases = sum(cases)) %>%
  pivot_wider(names_from = type,
              values_from = total_cases) %>%
  arrange(-confirmed)