dat <- read.csv("femaleMiceWeights.csv")
library(dplyr)

controls <- filter(dat, Diet=="chow")
controls <- select(controls, Bodyweight)
unlist(controls) # convierte un dataframe en vector

#para hacer lo mismo en una sola linea: 
controls <- filter(dat, Diet == "chow") %>% 
  select(Bodyweight) %>% unlist

# --------------------------------------------

library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
# download(url,filename)

data <- read.csv("msleep_ggplot2.csv")
class(data)

control <- filter(data, order == "Primates") %>% select(sleep_total)

nrow(control)
class(control)
