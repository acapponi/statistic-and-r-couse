library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

#elimina las lineas con valores vacios
dat <- na.omit( dat )

library(dplyr)

x <- filter(dat, Sex == "M" & Diet=="chow") %>% select(Bodyweight) %>% unlist

mean(x)

library(rafalib)

#to compute the population standard deviation
popsd(x)

set.seed(1)

mean(sample(x, 25))

y <- filter(dat, Sex == "M" & Diet == "hf") %>% select(Bodyweight) %>% unlist 

mean(y)
popsd(y)

mean(sample(y, 25))

abs((mean(y) - mean(x)) - (mean(sample(y, 25)) - mean(sample(x, 25))))

# ====================================

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

y <- filter(dat, Sex == "M" & Diet == "chow") %>% select(Bodyweight) %>% unlist

#If a list of numbers has a distribution that is well approximated by the normal distribution, what proportion of these numbers are within one standard deviation away from the list's average?
pnorm(1) - pnorm(-1)

#What proportion of these numbers are within two standard deviations away from the list's average?
pnorm(2) - pnorm(-2)

#What proportion of these numbers are within three standard deviations away from the list's average?
pnorm(3) - pnorm(-3)

#What proportion of the mice are within one standard deviation away from the average weight?
z <- ( y - mean(y) ) / popsd(y)
mean( abs(z) <=1 )


#para comparar cuantiles
qqnorm(z)
abline(0,1)

set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

mean(avgs)
popsd(avgs)
