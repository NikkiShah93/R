## we will be using the fpp library for our analysis
library(fpp)
## and the built-in datasets
?melsyd
plot(melsyd[,"Economy.Class"],
     main = "Economy Class Passangers",
     xlab="Year", ylab="Thousands")

?a10
seasonplot(a10, ylab='Sales in $M',
           xlab='Month',
           main = "Anti-Diabetic Drug Sales",
           year.labels = TRUE,
           year.labels.left = TRUE,
           col = 1:20,
           pch=19)
monthplot(a10, ylab='Sales in $M',
          xlab='Month',
          main = "Average Monthly Anti-Diabetic Drug Sales",
          xaxt="n"
          )
axis(1, at=1:12, labels = month.abb, cex=0.8)