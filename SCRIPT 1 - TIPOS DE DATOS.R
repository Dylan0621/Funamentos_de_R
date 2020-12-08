################################ TIPOS DE DATOS ################################
################################################################################

# FIJAR DIRECTORIO DE TRABAJO___________________________________________________

setwd("C:/Users/user/OneDrive - Universidad Externado de Colombia/R/Fundamentos de R")
getwd()
# ALT + - ' <- '

# INSTALAR PAQUETES O CARGAR LIBRERIAS__________________________________________

#install.packages("dplyr")
#install.packages("plyr")

library(plyr)
library(dplyr)


# IMPORTAR DATOS _______________________________________________________________

mtcars = read.csv("mtcars.csv", header = TRUE)
orangeec = read.csv("orangeec.csv", header = TRUE)

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

#_______________________________________________________________________________
# VECTORES _____________________________________________________________________

tiempo_platzi <- c(25,5,10,15,10)
tiempo_lecturas <- c(30,10,5,10,15)
tiempo_aprendizaje <- tiempo_platzi + tiempo_lecturas
tiempo_aprendizaje

dias_aprendizaje <- c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
dias_aprendizaje

dias_mas_20min <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
dias_mas_20min

total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi

total_tiempo_lecturas <- sum(tiempo_lecturas)
total_tiempo_lecturas

total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lecturas
total_tiempo_adicional

# Todo lo anterior no es muy comodo, es por eso que usaremos matrices
# ______________________________________________________________________________
# MATRICES _____________________________________________________________________

tiempo_matrix <- matrix(data = c(tiempo_platzi, tiempo_lecturas), 
                        nrow = 2,
                        byrow = TRUE)


dias <-  c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
tiempo <-  c("Tiempo Platzi", "Tiempo Lecturas")

colnames(tiempo_matrix) <- dias
rownames(tiempo_matrix) <- tiempo

tiempo_matrix
 
# Todos los pasos anteriores se encargan de crear la matriz, ahora se deben hacer
# las sumas por días

colSums(tiempo_matrix)

# ______________________________________________________________________________
# EJERCICIOS CON MATRICES ______________________________________________________

# 'rbind': permite agregar una nueva fila
final_matrix <- rbind(tiempo_matrix, "Podcast" = c(10, 15,30,5,0)) 
final_matrix

colSums(final_matrix)

final_matrix[1, 5] # Permite buscar un dato dentro de la matriz. Se debe indicar
                   # su fila y columna

# 'cbind': permite agregar una nueva columna
final_matrix <- cbind(final_matrix, "Sábado" = c(10, 10, 10))
final_matrix

# ?cbind


#_______________________________________________________________________________
# Operadores para comparar y ubicar datos ______________________________________

mtcars[mtcars$cyl < 6, ] # En esta busqueda de datos, el primer argumento corresponde
                  # a una busqueda en los registros. Mientras que el segundo
                  # corresponde a una busqueda en las variables. En este caso,
                  # nuestra búsqueda esta centrada en las observaciones, por ello,
                  # se pone la coma y dejamos sin valor la busqueda de variables

# Los paises en los cuales su GDP.PC es mayor(>) o igual(=) a 15000 USD
orangeec[orangeec$GDP.PC >= 15000, ] 

# Los paises en los cuales su aporte al GDP desde las industrias creativas
# es menor (<) o igual(=) a 2%
orangeec[orangeec$Creat.Ind...GDP <= 2, ]

# Buscar datos usando 'subset'
# colnames(orangeec): Ejecute para copiar los nombres de las variables
neworangeec <- subset(orangeec, Internet.penetration...population > 80 
                      & Education.invest...GDP >= 4.5)
neworangeec



# Ahora vamos a seleccionar estos datos pero desde la variable de economia naranja
# Usando 'select' para seleccionar variables
neworangeec <- subset(orangeec, Internet.penetration...population > 80 
                      & Education.invest...GDP >= 4.5,
                      select = Creat.Ind...GDP)
neworangeec

# Vamos a cambiar el nombre de una variable con 'rename'
# en la versión de R (version 4.0.2) más reciente hasta 2020
# esta función hace parte del paquete 'dplyr'

rename(orangeec,c("AporteEcNja"="Creat.Ind...GDP"))

# Con esta versión de R el primer argumento es el nombre que deseamos y el segundo
# argumento es el nombre que vamos a cambiar

# Para instalar paquetes, consulte este script o algunos tutoriales que he hecho 
# para este curso 





