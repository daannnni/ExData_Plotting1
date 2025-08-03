## read data 
df <- read.table("~/Documents/RStudio/coursera/4. Exploratory Data Analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subset relevant rows
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

## subset for dates 2007/02/01 and 2007/02/02
df2$DateTime <- strptime(paste(df2$Date, df2$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# 1st plot
plot(df2$DateTime, df2$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt="n")
axis(1,
     at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),
     labels=c("Thu","Fri","Sat"))


# 2nd plot
plot(df2$DateTime, df2$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt="n")
axis(1,
     at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),
     labels=c("Thu","Fri","Sat"))

# 3rd plot
plot(df2$DateTime, df2$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(df2$DateTime, df2$Sub_metering_2, col = "red")
lines(df2$DateTime, df2$Sub_metering_3, col = "blue")
axis(1,
     at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),
     labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 4th plot
plot(df2$DateTime, df2$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power", xaxt="n")
axis(1,
     at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),
     labels=c("Thu","Fri","Sat"))

dev.off()
