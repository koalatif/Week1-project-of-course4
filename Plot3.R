# Week1-project-of-course4
data <- read.table("C:/Users/USER/Desktop/project_C4_W1/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",
             header=TRUE, sep=";", na.strings="NA", dec=".", strip.white=TRUE)
Base<- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
Base$Global_active_power <- as.numeric(as.character(Base$Global_active_power))
Base$Global_reactive_power <- as.numeric(as.character(Base$Global_reactive_power))
Base$Voltage <- as.numeric(as.character(Base$Voltage))
Base$Sub_metering_1 <- as.numeric(as.character(Base$Sub_metering_1))
Base$Sub_metering_2 <- as.numeric(as.character(Base$Sub_metering_2))
Base$Sub_metering_3 <- as.numeric(as.character(Base$Sub_metering_3))
Base$Datetime <-paste(Base$Date, Base$Time)

#Plot3.png

png("plot3.png", width=480, height=480)
plot(strptime(Base$Datetime, "%d/%m/%Y %H:%M:%S"), Base$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(Base$Datetime, "%d/%m/%Y %H:%M:%S"), Base$Sub_metering_2, type = "l", col="red")
lines(strptime(Base$Datetime, "%d/%m/%Y %H:%M:%S"), Base$Sub_metering_3, type = "l", col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
