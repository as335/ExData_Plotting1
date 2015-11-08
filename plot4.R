project1<-read.table("hpc070201070202.txt", sep=";",header=TRUE)
head(project1)

project1$Date<-as.Date(project1$Date, format = "%d/%m/%Y")  
project1$timetemp<-paste(project1$Date, project1$Time)  
project1$Time<-strptime(project1$timetemp, format = "%Y-%m-%d %H:%M:%S")  
project1$weekdays<-weekdays(as.Date(project1$Date))

globalactivepower<-as.numeric(project1$Global_active_power)

voltage<-as.numeric(project1$Voltage)
globalreactivepower<-as.numeric(project1$Global_reactive_power)

globalactivepower<-as.numeric(project1$Global_active_power)
submetering1<-as.numeric(project1$Sub_metering_1)
submetering2<-as.numeric(project1$Sub_metering_2)
submetering3<-as.numeric(project1$Sub_metering_3)

png('plot4.png', width=480, height=480)
old.par<-par(mfrow=c(2,2))
plot(project1$Time, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(project1$Time, voltage, type="l", xlab="datetime", ylab="voltage")
plot(project1$Time, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(project1$Time, submetering2, type="l", col="red")
lines(project1$Time, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",lty=1, lwd=1, col=c("black", "red", "blue"), cex=0.9)
plot(project1$Time, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
par(old.par)
dev.off()
