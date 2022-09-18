load("skew.RData")
dim(dat) #Retrieve or set the dimension of an object.

#grilla de 3x3 graficos
par(mfrow = c(3,3))

for (i in 1:9) {
  qqnorm(dat[,i])
  qqline(dat[,i])
}

for (i in 1:9) {
  hist(dat[,i],
       seq(floor(min(dat[,i])), ceiling(max(dat[,i]))))
}

# As > 0 es exponencial hacia arriba cuando grafico qq plot
# As < 0 es exponencial desde abajo cuando grafico qq plot

#grilla de 1x1 graficos
par(mfrow=c(1,1))
