
power <- read.csv("~/J. Hopkins - Data Science/RFiles/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
str(power)
library(lubridate)
power$Date <- dmy(power$Date)
library(dplyr)
df1 <- filter(power, Date == "2007-02-01")
df2 <- filter(power, Date == "2007-02-02")
df <- rbind(df1,df2)
str(df)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.double(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.double(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.double(as.character(df$Sub_metering_3))
df$Voltage <- as.double(as.character(df$Voltage))
df$Global_reactive_power <- as.double(as.character(df$Global_reactive_power))

df$DT <- paste(df$Date, df$Time, sep = " ")
df$DT <- as.POSIXct(df$DT)

a <- df$Sub_metering_1
b <- df$Sub_metering_2
c <- df$Sub_metering_3
plot(df$DT, a, type = "l", ylab = "Energy Sub Metering",ylim = c(0,40), xlab = "")
par(new=T)
plot(df$DT, b, type = "l", ylab = "Energy Sub Metering", col = 'red', ylim = c(0,40), xlab = "")
par(new=T)
plot(df$DT, c, type = "l", ylab = "Energy Sub Metering", col = 'blue', ylim = c(0,40), xlab = "")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .75)
dev.copy(png, file = "plot3.png")
dev.off()
