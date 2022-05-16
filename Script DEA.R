
######### Caso Urbano 

#Creando los objetos
X <- with(Datos1, cbind(X))
Y <- with(Datos1, cbind(Y))
M1 <- with(Datos1, cbind(M1))
M2 <- with(Datos1, cbind(M2))

#Calculando puntos de eficiencia
puntos <- dea(X, Y, RTS = "crs", ORIENTATION = "in")

dea.plot(X, Y, RTS = "crs", ORIENTATION = "in-out", col="black", cex=1.2, lwd=3)

text(X, Y, as.character(M1), pos=3)
text(X, Y, as.character(M2), pos=1)

#Codigo para colocar lineas del origen a los puntos DMUs 
for (i in 1:length(Y)) {lines(c(0,X[i]), c(0,Y[i]), lty="dotted", lwd=1.5, col="green")}

######### Caso Semirural
#Creando los objetos
X <- with(Datos2, cbind(X))
Y <- with(Datos2, cbind(Y))
M <- with(Datos2, cbind(M))

#Calculando puntos de eficiencia
puntos <- dea(X, Y, RTS = "crs", ORIENTATION = "in")

dea.plot(X, Y, RTS = "crs", ORIENTATION = "in-out", col="black", cex=1.2, lwd=3)

text(X, Y, as.character(M), pos=3)

######### Caso Rural
#Creando los objetos
X <- with(Datos3, cbind(X))
Y <- with(Datos3, cbind(Y))
M1 <- with(Datos3, cbind(M1))
M2 <- with(Datos3, cbind(M2))
M3 <- with(Datos3, cbind(M3))


#Calculando puntos de eficiencia
puntos <- dea(X, Y, RTS = "crs", ORIENTATION = "in")

dea.plot(X, Y, RTS = "crs", ORIENTATION = "in-out", col="black", cex=1.2, lwd=3)

text(X, Y, as.character(M1), pos=1)
text(X, Y, as.character(M2), pos=2)
text(X, Y, as.character(M3), pos=4)

