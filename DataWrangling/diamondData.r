
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
## and we don't want any rows with nan in clarity
ideal_diamonds <- diamonds %>% 
  filter(cut=='Ideal', carat >= mean(diamonds$carat) |
           price >= mean(diamonds$price), !is.na(clarity))
## we can get the 
glimpse(ideal_diamonds)

## some of the columns might not be useful for our analysis
## and we can remove them by select
ideal_diamonds <- ideal_diamonds %>% 
  select(-c(x, y, z)) ## or select(!x:z) ## or select(!c(x,y,z))
glimpse(ideal_diamonds)

## lets say we want to rearrange the rows
## in a way that the prices are in ascending order
## where carats are in descending order
?arrange
ideal_diamonds <- ideal_diamonds %>% 
  arrange(price, desc(carat))
glimpse(ideal_diamonds)

## maybe converting carats to grams
## would be helpful for our analysis as well
## also, having price per carat could be helpful
ideal_diamonds <- ideal_diamonds %>% 
  mutate(grams=carat * .20,
         price_per_carat = round(price/carat, 2),
         color = tolower(color),
         depth_above_average = depth > mean(ideal_diamonds$depth))
glimpse(ideal_diamonds)
?slice
## getting the cheapest ideal diamond
## wit the highest carat
slice_head(ideal_diamonds)
## getting the most expensive ideal diamond
## with the lowest carat
slice_tail(ideal_diamonds)
## getting a sample of 10%
slice_sample(ideal_diamonds, prop = 0.1)

## getting the average price and weights
## (in grams) for each color
summarized_ideal_diamond <- ideal_diamonds %>% 
  group_by(color) %>% 
  summarise(average_price= mean(price),
            average_weight = mean(grams),
            counts = n())

glimpse(summarized_ideal_diamond)

## let's group them by clarity and get the average price
avg_price_ideal_diamonds <- ideal_diamonds %>% 
  group_by(clarity) %>% 
  summarise(avg_price = mean(price), 
            avg_depth = mean(depth), 
            avg_carat = mean(carat))
glimpse(avg_price_ideal_diamonds)
View(avg_price_ideal_diamonds)
