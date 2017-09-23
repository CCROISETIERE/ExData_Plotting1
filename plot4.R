#Create the subset data table
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$stripdate = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

##Plot #4

#Create panel 2x2
par(mfrow=c(2,2))
par(mar=c(4,4,4,4))

#Plot A
xlabel = ""
ylabel = "Global Active Power (kilowatts)"
plot(data$stripdate, data$Global_active_power, type = "l", xlab = xlabel, ylab = ylabel)

#Plot B
xlabel = "datetime"
ylabel = "Voltage"
plot(data$stripdate, data$Voltage, type = "l", xlab = xlabel, ylab = ylabel)

#Plot C
xlabel = ""
ylabel = "Energy sub metering"
plot(data$stripdate, data$Sub_metering_1, type = "l",  xlab = xlabel, ylab = ylabel, ylim = c(0,35))
points(data$stripdate, data$Sub_metering_2, type = "l", col = "red")
points(data$stripdate, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.7)

#Plot D
xlabel = "datetime"
ylabel = "Global_reactive_power"
plot(data$stripdate, data$Global_reactive_power, type = "l", xlab = xlabel, ylab = ylabel)

#Copy to PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
#Reset par
par(mfrow=c(1,1))