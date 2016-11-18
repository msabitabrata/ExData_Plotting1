## This R code generates a histogram for the Frequency of Global Active Power (kilowatts)

# Reads the data from the file household_power_consumption.txt and loads it into tableData. Seperator is semi-colom(;)
tableData <- read.table("household_power_consumption.txt", sep = ";", na.string="?", header=TRUE)

# Subsetting the data with the date 1/2/2007 and 2/2/2007
requiredData <- subset(tableData,tableData$Date=="1/2/2007" | tableData$Date=="2/2/2007")

# Opening a png file device with width 480px and height 480px
png(filename = "plot1.png",width = 480, height = 480, units = "px")

# Generating a Global Active Power Frequency Histogram
hist(requiredData$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")

# Closing the file device
dev.off()