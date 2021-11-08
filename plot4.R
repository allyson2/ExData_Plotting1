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

# Plot 4

df[,'Datetime'] <- df$Date + df$Time

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

with(df, plot(Datetime, Global_active_power
              , type='l'
              , xlab=""
              , ylab="Global Active Power"))

with(df, plot(Datetime, Voltage
              , type='l'
              , xlab="datetime"
              , ylab="Voltage"))

with(df, {
  plot(Datetime, Sub_metering_1
       , col="black"
       , type='l'
       , ylab="Energy sub metering"
       , xlab="")
  
  lines(Datetime, Sub_metering_2, col="red")
  lines(Datetime, Sub_metering_3, col="blue")
  legend("topright"
         , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2")
         , col=c("black", "red", "blue")
         , lty= 1
         , bty = "n")
})


with(df, plot(Datetime, Global_reactive_power
              , type='l'
              , xlab="datetime"
              , ylab="Global_reactive_power"))


dev.off()