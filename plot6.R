# Tarea 2 
# Carlos Obando
#----------------

# Pregunta 6.
# Compare las emisiones de fuentes de veh�culos de motor 
# en la ciudad de Baltimore con las emisiones de fuentes de veh�culos
# de motor en el condado de Los �ngeles, California
# (fips == "06037"). 
# �Qu� ciudad ha experimentado mayores cambios a lo largo del tiempo
# en las emisiones de los veh�culos de motor?
#-------------------------------------------------------------------------

setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(SCC)
table(SCC$SCC.Level.One)
bdd <- merge(NEI,SCC,by="SCC")
bdd1 <- subset(bdd,SCC.Level.One=="Mobile Sources" & 
                 (fips=="24510" | fips=="06037"))

#Plot 6

library("ggplot2")
bdd1$A�os <- factor(bdd1$year)
bdd1$fips <- ifelse(bdd1$fips=="24510","Baltimore","Los Angeles")

png("plot6.png",width=480,height=480)
ggplot(data=bdd1,aes(factor(fips),Emissions,fill=A�os)) +
  geom_boxplot()+ 
  labs(title="Baltimore vs Los Angeles - Emisiones de veh�culos a motor", 
       y="Emisiones", 
       x="Ciudades") + 
  ylim(c(0,400))
dev.off()

