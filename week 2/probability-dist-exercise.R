install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)

x <- filter(gapminder, year == "1952") %>% select(lifeExp) %>% unlist

hist(x)

#We can compute F in two ways: the simplest way is to type mean(x <= a). This calculates the number of values in x which are less than or equal to a, divided by the total number of values in x, in other words the proportion of values less than or equal to a.

#The second way, which is a bit more complex for beginners, is to use the ecdf() function. This is a bit complicated because this is a function that doesn't return a value, but a function.

a <- 40
mean(x <= a)


# ============
# Suppose we want to plot the proportions of countries with life expectancy q for a range of different years. R has a built in function for this, plot(ecdf(x)), but suppose we didn't know this. The function is quite easy to build, by turning the code from question 1.1 into a custom function, and then using sapply(). Our custom function will take an input variable q, and return the proportion of countries in x less than or equal to q. The curly brackets, { and }, allow us to write an R function which spans multiple lines:

prop = function(q) {
  mean(x <= q)
}

prop(40)

qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)

props = sapply(qs, function(q) mean(x <= q)) #en una linea

plot(ecdf(x)) #o nativamente
