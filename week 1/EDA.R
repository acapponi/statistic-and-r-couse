library(UsingR)
dframe=father.son
x=dframe$fheight

#sample toma una muestra random del array
round(sample(x, 20),1)

#seq devuelve una secuencia de numeros desde el mas chico al mas grande.
#uso el vaor min y max de la lista de alturas 
hist(x, 
     seq(floor(min(x)), ceiling(max(x))),
     main="Heights histogram",
     xlab="Height in inches")


# ================
#ecdf: Empirical Cumulative Distribution Function
#devuelve el porcentage de individuos bajo un limite
xs <- seq(floor(min(x)), ceiling(max(x)), .1)
plot(xs, 
     ecdf(x)(xs),
     type="l",
     xlab="Height un inches",
     ylab="F(x)"
     )

# ===============
#distribucion normal
# lo unico q necesito para resumir es la media, promedio y la desviacion estadar

mean(x>70) # el porcentaje de individuos sobre 70in
1-pnorm(70, mean(x), sd(x))

#si ambos porcentajes se acercan podemos pensar q la districion es normal
mean(x<60)
pnorm(60, mean(x), sd(x))

#==================
#q-q plot, quantil a quantil
ps <- seq(0.01, 0.99, 0.01)
qs <- quantile(x,ps)
normalqs <- qnorm(ps, mean(x), sd(x))
plot(normalqs, qs, xlab="Normal percentiles (Predichos)", ylab="Height in inches (Observados)")
#percentiles predichos por la normal vs percentiles observados
#como es una linea recta veo q hay una correlacion
abline(0,1)
#la distribucion normal predice muy bien las alturas

#para hacer automaticamente la normal
#puedo hacer esto en vez de lo de arriba
qqnorm(x)
qqline(x)


# ======================
#como la distribucion no es normal no puedo usar media y sd
hist(exec.pay, xlab="Thousands of dolars")
qqnorm(exec.pay)
qqline(exec.pay)

boxplot(exec.pay, ylab="Thousands of dolars", ylim=c(0,300))
