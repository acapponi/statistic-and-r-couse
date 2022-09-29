library(dplyr)
dat <- read.csv("week 1/femaleMiceWeights.csv") #previously downloaded

control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist

#diff <- mean(treatment) - mean(control)
#print(diff)

N <- length(treatment)
obs <- mean(treatment) - mean(control)
se <- sqrt(var(treatment)/N + var(control)/N)

tstat <- obs/se

1 - pnorm(tstat)
