# Coursera
# Exploratory Data Analysis
# Week 1
# Project 1
# Author: Andretti
# Date: 2016-05-15
# 

# Load data and store it in a variable
energy <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# convert Global Active Power variable to numeric values
energy$Global_active_power <- as.numeric(energy$Global_active_power)

# convert Date variable to Date values
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")

graph_data <- subset(energy, Date == '2007-02-01' | Date == '2007-02-02')

# open the PNG plotting device
png("plot1.png", height=480, width=480, units="px")

# Polot histogram with red-filled bars
hist(graph_data$Global_active_power, col='red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
