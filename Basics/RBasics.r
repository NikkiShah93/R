### importing dataset library

library(datasets)

## checking the first six rows of dataset
head(iris)
## Getting the stats of our data
summary(iris)
## Plotting a simple corr plot
plot(iris)

## we can simply remove the added package via detach
detach("package:datasets",unload = TRUE)

## to remove any plots
dev.off()
