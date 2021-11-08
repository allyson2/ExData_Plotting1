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

# Plot 1

png("plot1.png", width=480, height=480)

hist(df$Global_active_power
     , col="red"
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab="Frequency")

dev.off()