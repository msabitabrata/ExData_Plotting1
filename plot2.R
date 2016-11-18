## This R code generates a plot of Global Active Power (kilowatts) for Date=="1/2/2007" and "2/2/2007"

# Reads the data from the file household_power_consumption.txt and loads it into tableData. Seperator is semi-colom(;)
tableData <- read.table("household_power_consumption.txt", sep = ";", na.string="?", header=TRUE)

# Subsetting the data with the date 1/2/2007 and 2/2/2007
requiredData <- subset(tableData,tableData$Date=="1/2/2007" | tableData$Date=="2/2/2007")

# Creating a new variable DateTime with the Date and Time fields of the data frame
requiredData$DateTime <- as.POSIXct(paste(requiredData$Date,requiredData$Time), format="%d/%m/%Y %H:%M:%S")

# Opening a png file device with width 480px and height 480px
png(filename = "plot2.png",width = 480, height = 480, units = "px")

# Generating a plot of Global Active Power for Date=="1/2/2007" and "2/2/2007"
with(requiredData, plot(x=DateTime,y=Global_active_power,type = "o",pch=".",xlab="",ylab="Global Active Power (kilowatts)"))

# Closing the file device
dev.off()