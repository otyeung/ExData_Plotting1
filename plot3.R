# Exploratory Data Analysis - Course Project 1 (Plot 3)
# Step 1 - Loading the data
rm(list=ls())
t <- read.table("household_power_consumption.txt", header=TRUE,
                sep=";", colClasses = c("character", "character", "numeric",  "numeric",
                                        "numeric", "numeric", "numeric", "numeric", "numeric"),
                na.strings = "?")

# Merge Date and Time column into one field, and assign it back to Date column
# tmp <- as.POSIXlt(cat(dat$Date, dat$Time), tz = "", format="%d/%m/%Y %H:%M:%S")
t$Date <- as.POSIXct(paste(t$Date, t$Time), format="%d/%m/%Y %H:%M:%S")
t$Time <- NULL

# Subset data between 2007-02-01 and 2007-02-02
t <- subset(t, t$Date >= as.POSIXct('2007-02-01') & 
                    t$Date <= as.POSIXct('2007-02-02 23:59:00'))

# Look at the head and tail of data frame
head(t)
tail(t)

# Step 2 - Making the plot and send to PNG graphic device
png(filename = "plot3.png")
plot(t$Date, t$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(t$Date, t$Sub_metering_1, col="black")
lines(t$Date, t$Sub_metering_2, col="red")
lines(t$Date, t$Sub_metering_3, col="blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


