# Exploratory Data Analysis - Course Project 1 (Plot 1)
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

# Step 2 - Making the plot
hist(t$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power", breaks=20)

# Step 3 - Copy the plot to PNG file
dev.copy(png, file = "plot1.png")
dev.off()