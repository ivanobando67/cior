# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 3.
# De los cuatro tipos de fuentes indicados por la variable de tipo
# (puntual, no puntual, en la carretera, fuera de la carretera), 
# ¿cuál de estas cuatro fuentes ha experimentado una disminución 
# en las emisiones de 1999-2008 para la ciudad de Baltimore?
# ¿Cuáles han visto aumentos en las emisiones entre 1999 y 2008? 
# Utilice el sistema de trazado ggplot2 para hacer que un diagrama 
# responda a esta pregunta
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
bdd <- subset(NEI,fips == "24510")
str(bdd)

#Plot 3
library("ggplot2")

bdd$Años <- factor(bdd$year)
png("plot3.png",width=480,height=480)
ggplot(data=bdd,aes(factor(type),Emissions,fill=Años)) +
  geom_boxplot()+ 
  labs(title="Emisiones totales PM2.5 de Baltimore Maryland", 
       y="Emisiones", 
       x="Tipos de Emisión") + 
  ylim(c(0,400))

dev.off()


