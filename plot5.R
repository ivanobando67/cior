# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 5.
# �C�mo han cambiado las emisiones de fuentes de veh�culos de motor
# entre 1999 y 2008 en la ciudad de Baltimore?
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(SCC)
table(SCC$SCC.Level.One)
bdd <- merge(NEI,SCC,by="SCC")
bdd1 <- subset(bdd,SCC.Level.One=="Mobile Sources" & fips == "24510")

#Plot 5

png("plot5.png",width=480,height=480)
boxplot(bdd1$Emissions~factor(bdd1$year),
              main="Baltimore - Emisiones de veh�culos a motor",
              xlab="A�os",ylab="Emisiones",
              col=c("blue","red","green","pink"),
              ylim=c(0,15))
dev.off()

