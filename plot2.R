# Coursera
# Exploratory Data Analysis
# Week 1
# Project 1
# Author: Andretti
# Date: 2016-05-15
# 

#load lubridate library
library(lubridate)

# Load data and store it in a variable
energy <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# convert Global Active Power variable to numeric values
energy$Global_active_power <- as.numeric(energy$Global_active_power)

# convert Date variable to Date values
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

# Subset data to dates from 2007-02-[01,02]
graph_data <- subset(energy, Date == '2007-02-01' | Date == '2007-02-02')

# combine date and time columns and convert to posix date time type
graph_data$datetime <- as.POSIXct(paste(graph_data$Date, graph_data$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

# open the PNG plotting device
png("plot2.png", height=480, width=480, units = "px")

with(graph_data, plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)"))

# close plotting device
dev.off()
