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

# Plot 2

df[,'Datetime'] <- df$Date + df$Time

png("plot2.png", width=480, height=480)

with(df, plot(Datetime, Global_active_power
              , type='l'
              , xlab=""
              , ylab="Global Active Power (kilowatts)"))

dev.off()