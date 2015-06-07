# Exploratory Analays Course
# Project 1, Plot 2

library(sqldf)

# Read the data
data <- read.csv.sql('.\\data\\household_power_consumption.txt', sql='select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE, sep=";", stringsAsFactors=FALSE)
closeAllConnections()

dateTime <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))

# Open the plot device first
png("plot2.png", width=480, height=480)
plot(dateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
# Shut down plot device
dev.off()