## read file
## assuming dataset "household_power_consumption.txt" has been downloaded to working directory
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.string = "?")

## read 2-day data for plot
plotdata <- rawdata[as.Date(rawdata$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01","2007-02-02")),]

## Add a new vaiable DateTime to combine Date and Time
DateTime <- strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(plotdata, DateTime)

## plot3
png("plot3.png", width = 480, height = 480, units = "px")
with(plotdata, {
        plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "" )
        points(DateTime, Sub_metering_2, type = "l", col = "red" )
        points(DateTime, Sub_metering_3, type = "l", col = "blue" )
        legend("topright", lty = "solid", lwd =1, col = c("black", "red", " blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
        ## dev.copy(png, file = "plot2.png")
dev.off()
