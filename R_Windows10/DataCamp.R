# Introduction to the TIDYVERSE taught by David Robinson

install.packages("gapminder")
library(gapminder)
library(dplyr)
gapminder

# the filter verb 
# pipe it up, take it and feed it 
gapminder %>% 
  filter( year == 2007)

gapminder %>% 
  filter( country == "United States")

gapminder %>% 
  filter( year == 2007, country == "United States")

# the arrange verb 
# sorts a table based on a variable, like min & max
gapminder %>%
  arrange(gdpPercap)

gapminder %>%
  arrange(desc(gdpPercap))

gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

# Sort in ascending order of lifeExp
gapminder %>%
  arrange(lifeExp)

# Sort in descending order of lifeExp
gapminder %>%
  arrange(desc(lifeExp))

# the mutate verb 
# changes or adds variables
gapminder %>% 
  mutate(pop = pop / 1000000)

gapminder %>% 
  mutate(gdp = gdpPercap * pop)

# combining verbs
gapminder %>%
  #creates the col
  mutate(gdp = gdpPercap * pop) %>%
  #filters the col for 2007
  filter(year == 2007) %>%
  #arranges the new col for sorting in desc format
  arrange(desc(gdp))
# Note that USA is highest and note the top results



