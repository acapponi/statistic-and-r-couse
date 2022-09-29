set.seed(1)

#What proportion of these 1,000 averages are more than 1 gram away from the average of x


library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  nulls[i] <- mean(sample(x, 5))
}

hist(nulls)
mean(abs(nulls - mean(x)) > 1)
