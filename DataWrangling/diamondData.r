
## first we need to import tidyverse
library(tidyverse)

## we'll be using diamond dataset
?diamonds
## first looking at the data
## to get some ideas
View(diamonds)
## maybe we want to filter by rows
ideal_diamonds <- diamonds %>% 
  filter(cut == 'Ideal')
glimpse(ideal_diamonds)

## maybe we're interested in a few columns
## for that we can use select
?select

ideal_diamonds <- ideal_diamonds %>% 
  select(carat, clarity, depth, price)
glimpse(ideal_diamonds)

## let's group them by clarity and get the average price
avg_price_ideal_diamonds <- ideal_diamonds %>% 
  group_by(clarity) %>% 
  summarise(avg_price = mean(price), 
            avg_depth = mean(depth), 
            avg_carat = mean(carat))
glimpse(avg_price_ideal_diamonds)
View(avg_price_ideal_diamonds)
