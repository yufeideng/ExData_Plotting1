
# Course Project 1: plot 4 ------------------------------------------------

househodpower <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
samp_power <- subset(househodpower, househodpower$Date == "1/2/2007" | househodpower$Date == "2/2/2007")

rm(househodpower)

str(samp_power)

samp_power$Global_active_power <- as.numeric(samp_power$Global_active_power)
samp_power$Voltage <- as.numeric(samp_power$Voltage)
samp_power$Sub_metering_1 <- as.numeric(samp_power$Sub_metering_1)
samp_power$Sub_metering_2 <- as.numeric(samp_power$Sub_metering_2)
samp_power$Sub_metering_3 <- as.numeric(samp_power$Sub_metering_3)
samp_power$Global_reactive_power <- as.numeric(samp_power$Global_reactive_power)

samp_power$dt_time <- paste(samp_power$Date,samp_power$Time)

samp_power$dt_time <- strptime(samp_power$dt_time, format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

with(samp_power, plot(dt_time, Global_active_power, type = "l", xlab = "", ylab = ""))
with(samp_power, plot(dt_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

plot(samp_power$dt_time,samp_power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub meeting")
with(samp_power, lines(dt_time, Sub_metering_1))
with(samp_power, lines(dt_time, Sub_metering_2, col = "red"))
with(samp_power, lines(dt_time, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.6)

with(samp_power, plot(dt_time, Global_reactive_power, type = "l", xlab = "datetime"))
dev.copy(png, "./ExData_Plotting1/plot4.png")
dev.off()
