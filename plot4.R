# Load the data 
dataset <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, skipNul = TRUE, na.strings = "?")

# Reorder the format of the Date variable to days-month-year format
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the total data only for the required dates and reorder the rows from 0
data_subset <- subset(dataset, dataset$Date >= "2007/02/01" & dataset$Date <= "2007/02/02")
rownames(data_subset) <- NULL

# First concat the Date and Time variables and then convert to POSIXct form for plotting
data_subset$datetime <- as.POSIXct(paste(data_subset$Date,data_subset$Time), tz = 'UCT')

# To save the file setup
png(file = "C:/Users/Adway/Desktop/R/EDA/plot4.png", width=480, height=480)

# Set the margins and mulitple plots and then add the plots as required
par(mfrow = c(2,2), mar = c(4,4,4,4))
with(data_subset, {
  plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
  plot(datetime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  plot(data_subset$datetime,data_subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(data_subset$datetime, data_subset$Sub_metering_2, col = "red")
  lines(data_subset$datetime, data_subset$Sub_metering_3, col = "blue")
  legend("topright", inset = 0.01, lty = 1, cex = 0.8,box.lty=0, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(datetime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

#Close the device after saving file
dev.off()
