## This R code generates four plots for Date=="1/2/2007" and "2/2/2007"
## The first quadrant will be for Global active power
## The second quadrant will be for Voltage
## The third quadrant will be for Sub metering
## The fourth quadrant will be for Global reactive power

# Reads the data from the file household_power_consumption.txt and loads it into tableData. Seperator is semi-colom(;)
tableData <- read.table("household_power_consumption.txt", sep = ";", na.string="?", header=TRUE)

# Subsetting the data with the date 1/2/2007 and 2/2/2007
requiredData <- subset(tableData,tableData$Date=="1/2/2007" | tableData$Date=="2/2/2007")

# Creating a new variable DateTime with the Date and Time fields of the data frame
requiredData$DateTime <- as.POSIXct(paste(requiredData$Date,requiredData$Time), format="%d/%m/%Y %H:%M:%S")

# Opening a png file device with width 480px and height 480px
png(filename = "plot4.png",width = 480, height = 480, units = "px")

# Calling par to mention the mfrow, mar and oma. This is used to create four plots in four quadrants
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Generating a plot of Global active power for Date=="1/2/2007" and "2/2/2007" in the first quadrant
with(requiredData, plot(x=DateTime,y=Global_active_power,type = "o",pch=".",xlab="",ylab="Global Active Power (kilowatts)",cex=.5))

# Generating a plot of Voltage for Date=="1/2/2007" and "2/2/2007" in the second quadrant
with(requiredData, plot(x=DateTime,y=Voltage,type = "o",pch=".",xlab="datetime",ylab="Voltage"))

# Generating a plot of Sub metering for Date=="1/2/2007" and "2/2/2007" in the third quadrant
plot(requiredData$DateTime,requiredData$Sub_metering_1,type = "o",pch=".",xlab="",ylab="Energy sub metering")
lines(requiredData$DateTime,requiredData$Sub_metering_2,type = "o",pch=".",col="red")
lines(requiredData$DateTime,requiredData$Sub_metering_3,type = "o",pch=".",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(1,1,1),cex=0.75,bty = "n")

# Generating a plot of Global reactive power for Date=="1/2/2007" and "2/2/2007" in the fourth quadrant
with(requiredData, plot(x=DateTime,y=Global_reactive_power,type = "o",pch=".",xlab="datetime",ylab="Global_reactive_power"))

# Closing the file device
dev.off()