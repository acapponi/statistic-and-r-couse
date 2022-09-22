library(dplyr)
dat <- read.csv("week 1/femaleMiceWeights.csv")

control <- filter(dat, Diet=="chow") %>%
  select(Bodyweight) %>% unlist
treatment <- filter(dat, Diet=="hf") %>% 
  select(Bodyweight) %>% unlist


# en este caso tenemos datos de toda la poblacion, asi que podemos tomar una muestra y ver si su media esta alineada con la del grupo de control
population <- read.csv("week 1/femaleControlsPopulation.csv") %>%  unlist

mean(sample(population, 12))
mean(control)
mean(treatment)

obs <- mean(treatment) - mean(control)

#probamos que pasa cuando la hipotesis nula es verdadera
# "no hay efectos en la dieta alta en grasa"
# tomo un nuevo grupo de control de la poblacion
# y hago de cuenta que tengo un grupo con un tratamiento que es "sin tratamiento"
control <- sample(population, 12)
treatment <- sample(population, 12)
mean(treatment) - mean(control)

