# Load the data 
dataset <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, skipNul = TRUE, na.strings = "?")

# Reorder the format of the Date variable to days-month-year format
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the total data only for the required dates and reorder the rows from 0
data_subset <- subset(dataset, dataset$Date >= "2007/02/01" & dataset$Date <= "2007/02/02")
rownames(data_subset) <- NULL

# First concat the Date and Time variables and then convert to POSIXct form for plotting
data_subset$day <- as.POSIXct(paste(data_subset$Date,data_subset$Time), tz = 'UCT')

# To save the file setup
png(file = "C:/Users/Adway/Desktop/R/EDA/plot3.png", width=480, height=480)

# Plot the required data and then add more lines and legend
plot(data_subset$day,data_subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data_subset$day, data_subset$Sub_metering_2, col = "red")
lines(data_subset$day, data_subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, cex = 0.8, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Close the device after saving file
dev.off()
