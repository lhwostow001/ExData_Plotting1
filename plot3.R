# Exploratory Analays Course
# Project 1, Plot 3

library(sqldf)

# Read the data
data <- read.csv.sql('.\\data\\household_power_consumption.txt', sql='select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE, sep=";", stringsAsFactors=FALSE)
closeAllConnections()

# Combine date and time
dateTime <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

# Open the plot device first
png("plot3.png", width=480, height=480)
# Plot the metering data in three separate lines
plot(dateTime, data$Sub_metering_1, col="black", xlab="", ylab = "Energey sub metering", type = "l")
lines(dateTime, data$Sub_metering_2, col="red", type = "l")
lines(dateTime, data$Sub_metering_3, col="blue", type = "l")
legend("topright", lty=c(1,1,1), cex=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Shut down plot device
dev.off()