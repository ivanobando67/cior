# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 1.
# Han disminuido las emisiones totales de PM2.5 en los Estados Unidos
# de 1999 a 2008? 
# Utilizando el sistema de trazado base, haga un gr�fico que muestre 
# la emisi�n total de PM2.5 de todas las fuentes para cada uno de los a�os
# 1999, 2002, 2005 y 2008
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

#Plot 1

png("plot1.png",width=480,height=480)
with(NEI,plot(factor(year),Emissions,main="Emisi�n total PM2.5 por a�os",
        xlab="A�os",ylab="Emisiones",col=c("blue","red","green","pink"),
        ylim=c(0,8e+4)))
dev.off()


