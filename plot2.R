data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot2.png", width=480, height=480)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,subsetdata$Global_active_power,type = "l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
