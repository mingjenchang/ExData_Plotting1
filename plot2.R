## read file
## assuming dataset "household_power_consumption.txt" has been downloaded to working directory
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.string = "?")

## read 2-day data for plot
plotdata <- rawdata[as.Date(rawdata$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01","2007-02-02")),]

## Add a new vaiable DateTime to combine Date and Time
DateTime <- strptime(paste(plotdata$Date,plotdata$Time),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(plotdata, DateTime)

## plot2
png("plot2.png", width = 480, height = 480, units = "px")
with(plotdata, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))
## dev.copy(png, file = "plot2.png")
dev.off()
