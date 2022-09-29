# definida por una integral que depende de la media y la desviacion estandar
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

par(mfrow = c(1,2))

hist(averages5)
hist(averages50)

#para saber que proporcion estan entre 23 y 25 uso condicionales dentro de la media
mean( averages50 < 25 & averages50 > 23)

#misma forma de usar pnorm
pnorm(mean(averages50), 23.9, 0.43)
pnorm( (mean(averages50)-23.9)/ 0.43 )

#What is the proportion of observations between 23 and 25 in a normal distribution with average 23.9 and standard deviation 0.43?
pnorm25 <- pnorm( (25-23.9) / 0.43)
pnorm23 <- pnorm( (23-23.9) / 0.43) 
pnorm25 - pnorm23

#idem a hacer 
pnorm( (25-23.9) / 0.43)  - pnorm( (23-23.9) / 0.43) 

