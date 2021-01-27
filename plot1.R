# Load the data 
dataset <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, skipNul = TRUE, na.strings = "?")

# Reorder the format of the Date variable to days-month-year format
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Subset the total data only for the required dates and reorder the rows from 0
data_subset <- subset(dataset, dataset$Date >= "2007/02/01" & dataset$Date <= "2007/02/02")
rownames(data_subset) <- NULL

# To save the file setup
png(file = "C:/Users/Adway/Desktop/R/EDA/plot1.png", width=480, height=480)

# Plot the required histogram
hist(data_subset$Global_active_power, xlab = "Global Active Power (Kilowatts)", col = "red", main = "Global Active Power")

#Close the device after saving file
dev.off()
