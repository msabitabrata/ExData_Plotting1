## This R code generates a plot of Sub metering data for Date=="1/2/2007" and "2/2/2007"

# Reads the data from the file household_power_consumption.txt and loads it into tableData. Seperator is semi-colom(;)
tableData <- read.table("household_power_consumption.txt", sep = ";", na.string="?", header=TRUE)

# Subsetting the data with the date 1/2/2007 and 2/2/2007
requiredData <- subset(tableData,tableData$Date=="1/2/2007" | tableData$Date=="2/2/2007")

# Creating a new variable DateTime with the Date and Time fields of the data frame
requiredData$DateTime <- as.POSIXct(paste(requiredData$Date,requiredData$Time), format="%d/%m/%Y %H:%M:%S")

# Opening a png file device with width 480px and height 480px
png(filename = "plot3.png",width = 480, height = 480, units = "px")

# Generating a plot of Sub_metering_1 for Date=="1/2/2007" and "2/2/2007"
plot(requiredData$DateTime,requiredData$Sub_metering_1,type = "o",pch=".",xlab="",ylab="Energy sub metering")

# Adding a plot of Sub_metering_2 for Date=="1/2/2007" and "2/2/2007"
lines(requiredData$DateTime,requiredData$Sub_metering_2,type = "o",pch=".",col="red")

# Adding a plot of Sub_metering_3 for Date=="1/2/2007" and "2/2/2007"
lines(requiredData$DateTime,requiredData$Sub_metering_3,type = "o",pch=".",col="blue")

# Adding legends in top-right position 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=c(1,1,1))

# Closing the file device
dev.off()