data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime,subsetdata$Global_active_power,type = "l",ylab="Global Active Power(kilowatts)",xlab="")

plot(datetime,subsetdata$Voltage,type = "l",ylab="Voltage",xlab="datetime")

plot(datetime,subsetdata$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
lines(datetime,subsetdata$Sub_metering_2,type = "l",col="red")
lines(datetime,subsetdata$Sub_metering_3,type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(datetime,subsetdata$Global_reactive_power,type = "l",ylab="Global_reactive_power",xlab="datetime")

dev.off()

