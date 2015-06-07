# Exploratory Analays Course
# Project 1, Plot 1

library(sqldf)

data <- read.csv.sql('.\\data\\household_power_consumption.txt', sql='select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE, sep=";", stringsAsFactors=FALSE)
closeAllConnections()

data$Date <- as.Date(strptime(data$Date, "%D"))

# Open the plot device first
png("plot1.png", width=480, height=480)
# Plot the histogram
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
     col="red", main = paste("Global Active Power"))
# Shut down plot device
dev.off()