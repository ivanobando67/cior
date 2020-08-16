# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 2.
# ¿Han disminuido las emisiones totales de PM2.5 en la ciudad de 
# Baltimore, Maryland (fips == "24510" | fips == "24510")
# de 1999 a 2008? 
# Utilice el sistema de trazado base para hacer un diagrama que responda
# a esta pregunta
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
bdd <- subset(NEI,fips == "24510")

#Plot 2

png("plot2.png",width=480,height=480)
with(bdd,plot(factor(year),Emissions,
              main="Emisiones totales PM2.5 de Baltimore Maryland",
        xlab="Años",ylab="Emisiones",col=c("blue","red","green","pink"),
        ylim=c(0,500)))
dev.off()


