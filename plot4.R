# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 4.
# En todo Estados Unidos, 
# �c�mo han cambiado las emisiones de fuentes relacionadas
# con la combusti�n de carb�n entre 1999 y 2008?
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(SCC)
table(SCC$SCC.Level.One)
bdd <- merge(NEI,SCC,by="SCC")
bdd1 <- subset(bdd,SCC.Level.One=="External Combustion Boilers")

#Plot 4

png("plot4.png",width=480,height=480)
boxplot(bdd1$Emissions~factor(bdd1$year),
              main="Emisiones por combusti�n de carb�n",
              xlab="A�os",ylab="Emisiones",
              col=c("blue","red","green","pink"),
              ylim=c(0,10000))
dev.off()

