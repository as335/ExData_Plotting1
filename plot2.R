project1<-read.table("hpc070201070202.txt", sep=";",header=TRUE)
head(project1)

project1$Date<-as.Date(project1$Date, format = "%d/%m/%Y")  
project1$timetemp<-paste(project1$Date, project1$Time)  
project1$Time<-strptime(project1$timetemp, format = "%Y-%m-%d %H:%M:%S")  
project1$weekdays<-weekdays(as.Date(project1$Date))

globalactivepower<-as.numeric(project1$Global_active_power)

png('plot2.png', width=480, height=480)
plot(project1$Time, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
