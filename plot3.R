# Reading data

colClasses=c("character", "character", rep("numeric",7))
df <- read.csv("household_power_consumption.txt"
               , sep = ";"
               , colClasses = colClasses
               , na.strings = '?'
               , )

df[, 'Date'] <- dmy(df[, 'Date'])
df[, 'Time'] <- hms(df[, 'Time'])
df <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot 3

df[,'Datetime'] <- df$Date + df$Time

png("plot3.png", width=480, height=480)

plot(df$Datetime, df$Sub_metering_1, col="black", type="l", ylab="Energy sub metering")
points(df$Datetime, df$Sub_metering_2, col="red", type="l")
points(df$Datetime, df$Sub_metering_3, col="blue", type="l")
legend("topright"
       , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2")
       , col=c("black", "red", "blue")
       , lty= 1)

dev.off()