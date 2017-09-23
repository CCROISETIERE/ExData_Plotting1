#Create the subset data table
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$stripdate = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#### Plot #2
xlabel = ""
ylabel = "Global Active Power (kilowatts)"

plot(data$stripdate, data$Global_active_power, type = "l", xlab = xlabel, ylab = ylabel)

#Copy to PNG
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
