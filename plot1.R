## read data 
df <- read.table("~/Documents/RStudio/coursera/4. Exploratory Data Analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## subset relevant rows
df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

## subset for dates 2007/02/01 and 2007/02/02
df2$DateTime <- strptime(paste(df2$Date, df2$Time), "%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(df2$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
