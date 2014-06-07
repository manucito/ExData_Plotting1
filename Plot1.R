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


# Plot 1

png(file = "plot1.png", width = 480, height = 480)
hist(ElecData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

