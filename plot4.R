# Exploratory Analays
# Project 1, Plot 4

library(sqldf)

# Read the data
data <- read.csv.sql('.\\data\\household_power_consumption.txt', sql='select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE, sep=";", stringsAsFactors=FALSE)
closeAllConnections()

# Combine date and time
dateTime <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

# Open the plot device first
png("plot4.png", width=480, height=480)
# Plot the four graphs
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(dateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(dateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(dateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(dateTime, data$Sub_metering_2, col="red", type = "l")
  lines(dateTime, data$Sub_metering_3, col="blue", type = "l")
  legend("topright", bty = "n", lty=c(1,1,1), cex=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()