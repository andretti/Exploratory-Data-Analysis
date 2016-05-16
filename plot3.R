# Coursera
# Exploratory Data Analysis
# Week 1
# Project 1
# Author: Andretti
# Date: 2016-05-15
# 

# Read data from file
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
chartdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# convert date, time to Posix format
datetime <- strptime(paste(chartdata$Date, chartdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert to numeric values
globalActivePower <- as.numeric(chartdata$Global_active_power)
subMetering1 <- as.numeric(chartdata$Sub_metering_1)
subMetering2 <- as.numeric(chartdata$Sub_metering_2)
subMetering3 <- as.numeric(chartdata$Sub_metering_3)

# open PNG graphics device
png("plot3.png", width=480, height=480)

# draw graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close graphics device
dev.off()
