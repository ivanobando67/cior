# Tarea 1
# Carlos Obando
#----------------

#install.packages("rio")
library("rio")
setwd("C:/CIOR/UNIVERSIDAD_CENTRAL/COURSERA/DATA/")
bdd<- read.delim("household_power_consumption.txt")
head(bdd)
bdd$gap<-as.numeric(bdd$Global_active_power)/1000

#install.packages("lubridate")
library("lubridate")
bdd$dia<-wday(bdd$fecha)
class(bdd$Date)
bdd$fecha<-as.Date(strptime(bdd$Date,format="%d/%m/%y"))
bdd$dia<-factor(wday(bdd$fecha),levels=c(1:7),
                labels=c("Lun","Mar","Mie",
                         "Jue","Vie","Sab","Dom"))

#Plot 1
png("plot1.png",width=480,height=480)
hist(bdd$gap,main="Global active power",col="red",breaks=20,
     xlab="Kilovatios",ylab="Frecuencia")
dev.off()

# Plot 2
png("plot2.png",width=480,height=480)
with(bdd,plot(dia,gap,type="s", main="Global active power",
              xlab="Dias",ylab="Kilovatios"))
dev.off()

#Plot 3
png("plot3.png",width=480,height=480)
par(mfrow=c(1,3))
plot(bdd$dia,bdd$Sub_metering_1,xlab="Día",ylab="Sub_Metering1")
plot(bdd$dia,bdd$Sub_metering_2,col="blue",xlab="Día",ylab="Sub_Metering2")
plot(bdd$dia,bdd$Sub_metering_3,col="red",xlab="Día",ylab="Sub_Metering3")
dev.off()


#Plot 4
png("plot4.png",width=480,height=480)
plot(bdd$Voltage,main="Voltage",col="blue")
dev.off()

