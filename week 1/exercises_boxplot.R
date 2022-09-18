#InsectSprays data set measures the counts of insects in agricultural experimental units treated with different insecticides. This dataset is included in R
head(InsectSprays)

View(InsectSprays)

#split(x,f) divide el vector x en grupos de f
boxplot(split(InsectSprays$count, InsectSprays$spray))

#hace lo mismo que:
boxplot(InsectSprays$count ~ InsectSprays$spray)

# ====================

library(dplyr)
library(UsingR)
ny <- nym.2002

par(mfrow=c(1,3))
boxplot(ny$time ~ ny$gender)
div <- split(ny$time, ny$gender)
hist(div$Female, ylim=c(0, 300), xlim=c(0, 600))
hist(div$Male, ylim=c(0, 300), xlim=c(0, 600))

