require(lubridate)

# Set working directory
# Read data locally

setwd("~/Dropbox/R/Learning/ExploratoryDataAnalysis/Project1")

ElecDataRaw = read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", colClasses=c( rep("character", 2), rep("numeric", 7)))

# Set Date variable to proper format

ElecDataRaw$Date = as.Date(ElecDataRaw$Date, "%d/%m/%Y")

# Subset Data to correct time period

ElecData = subset(ElecDataRaw, (Date == "2007-02-01" | Date == "2007-02-02"))

# Create DateTime variable for graphing

ElecData$DateTime <- ymd_hms(paste(ElecData$Date, ElecData$Time, sep = "_"))


# Plot 3

png(file = "plot3.png", width = 480, height = 480)
with(ElecData, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Energy Sub Metering")) 
with(ElecData, lines(Sub_metering_2 ~ DateTime, col="red"))
with(ElecData, lines(Sub_metering_3 ~ DateTime, col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), xjust=1, yjust=0, y.intersp = 1, bty="o", inset = c(0,0), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()

