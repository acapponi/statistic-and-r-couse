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

# === distribucion nula
#probamos que pasa cuando la hipotesis nula es verdadera
# "no hay efectos en la dieta alta en grasa"
# tomo un nuevo grupo de control de la poblacion
# y hago de cuenta que tengo un grupo con un tratamiento que es "sin tratamiento"

n <- 1000
nulls <- vector("numeric", n)
for (i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)
}

sum(nulls > obs) / n #propocion de control > observado
mean(nulls > obs) #esto da lo mismo

mean(abs(nulls) > obs) #veo cuan seguido es mayor en valor absoluto(modulo) <- p-value
# p-value = probabilidad de que el resultado de la distribucion nula sea mayor a lo observado cuando la hipotesis nula es verdadera
