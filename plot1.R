project1<-read.table("hpc070201070202.txt", sep=";",header=TRUE)
head(project1)

png('plot1.png')
hist(project1$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
