################################ TIPOS DE DATOS ################################
################################################################################

# FIJAR DIRECTORIO DE TRABAJO___________________________________________________

setwd("C:/Users/user/OneDrive - Universidad Externado de Colombia/R/Fundamentos de R")
getwd()

# IMPORTAR DATOS _______________________________________________________________

mtcars = read.csv("mtcars.csv")
orangeec = read.csv("orangeec.csv")

# Conocer los tipos de datos ___________________________________________________

str(mtcars) # Permite conocer la estructura del data set

?mtcars

class(mtcars$vs) # Para ver la estructura de una variable
                 # '$' Permite acceder a una variable
class(mtcars$am)


mtcars$vs = as.logical(mtcars$vs) # Permite comvertir la clase de un valor
mtcars$am = as.logical(mtcars$am) # EJ: Convertir de int a log

# RETO 1 _______________________________________________________________________
# Explorar los datos de orangeec

str(orangeec) # 17 obs. of  13 variables
dim(orangeec) # Permite conocer claramente el número de observaciones y variables
ncol(orangeec)
nrow(orangeec)
names(orangeec)
summary(orangeec)

#_______________________________________________________________________________

# TRANSFORMACIÓN DE DATO EN MTCARS _____________________________________________

summary(mtcars)

wt <- (mtcars$wt * 1000) / 2.20462262
wt # Esta variable, otorga los valores en libras.Para lo cual, los transformaré 
   # a Kg en el dataset

# Algunos datos relevantes son
# 1 kg = 2.20462262 lb
# 1 lb = 0.45359237 kg
# NIST, Instituto Nacional de Estándares y Tecnología de los Estados Unidos, 
# recomienda la siguiente aproximación: 1 kg = 2.20 lb 


mtcars.new <- transform(mtcars,wt = wt * 1000 / 2.20462262)
summary(mtcars.new)





