################################ TIPOS DE DATOS ################################
################################################################################

# FIJAR DIRECTORIO DE TRABAJO___________________________________________________

setwd("C:/Users/user/OneDrive - Universidad Externado de Colombia/R/Fundamentos de R")
getwd()

# IMPORTAR DATOS _______________________________________________________________

mtcars = read.csv("mtcars.csv")
orangeec = read.csv("orangeec.csv")

# Conocer los tipos de datos ___________________________________________________

str(mtcars) # Permite concoer la estructura del data set

?mtcars

class(mtcars$vs) # Para ver la estructura de una variable
                 # '$' Permite acceder a una variable
class(mtcars$am)

mtcars$vs = as.logical(mtcars$vs) # Permite comvertir la clase de un valor
mtcars$am = as.logical(mtcars$am) # EJ: Convertir de int a log

# RETO 1 _______________________________________________________________________
# Explorar los datos de orangeec

str(orangeec) # 17 obs. of  13 variables
dim(orangeec) # Permite conocer claramente el numero de observaciones y variables







