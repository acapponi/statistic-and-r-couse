library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

#the correct random number generator (RNG) settings
RNGkind("Mersenne-Twister", "Inversion", "Rejection")

mean(x)

#What is the absolute value (use abs()) of the difference between the average of the sample and the average of all the values?
set.seed(1)
abs(mean(sample(x, 5))-mean(x))

#diferente porque the average of the samples is a random variable.
set.seed(5)
abs(mean(sample(x, 5))-mean(x))
