#Create the subset data table
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$stripdate = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#### Plot #1
#Assign correct label for plot
xlabel = "Global Active Power (kilowatts)"
ylabel = "Frequency"
ptitle = "Global Active Power"

#Pot histogram
hist(as.numeric(as.character(data$Global_active_power)), col = "red", xlab = xlabel, ylab = ylabel, 
     main = ptitle, ylim = c(0,1200))

#Copy to PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()