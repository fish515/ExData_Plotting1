data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot3.png", width=480, height=480)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,subsetdata$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
lines(datetime,subsetdata$Sub_metering_2,type = "l",col="red")
lines(datetime,subsetdata$Sub_metering_3,type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
