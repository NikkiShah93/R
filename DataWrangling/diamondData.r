
## we will be using the tidyverse family in this project
library(tidyverse)
## and the data we will be using is the diamond set
## which we can quickly check to see what are the available information
?diamonds
## and take a glimpse into it as well 
glimpse(diamonds)

## lets say we only want the ideal type of diamond for our analysis
## we can simply use filter to only get those cuts
## and we're only interested in the ones
## that have above average carats
ideal_diamonds <- diamonds %>% 
  filter(cut=='Ideal', carat >= mean(diamonds$carat) |
           price >= mean(diamonds$price))
## we can get the 
glimpse(ideal_diamonds)

## some of the columns might not be useful for our analysis
## and we can remove them by select
ideal_diamonds <- ideal_diamonds %>% 
  select(!c(x, y, z)) ## or select(!x:z)
glimpse(ideal_diamonds)


## let's group them by clarity and get the average price
avg_price_ideal_diamonds <- ideal_diamonds %>% 
  group_by(clarity) %>% 
  summarise(avg_price = mean(price), 
            avg_depth = mean(depth), 
            avg_carat = mean(carat))
glimpse(avg_price_ideal_diamonds)
View(avg_price_ideal_diamonds)
