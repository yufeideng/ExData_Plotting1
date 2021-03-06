
# Course Project 1: Plot 3 ------------------------------------------------

househodpower <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
samp_power <- subset(househodpower, househodpower$Date == "1/2/2007" | househodpower$Date == "2/2/2007")

rm(househodpower)

str(samp_power)

samp_power$Sub_metering_1 <- as.numeric(samp_power$Sub_metering_1)
samp_power$Sub_metering_2 <- as.numeric(samp_power$Sub_metering_2)
samp_power$Sub_metering_3 <- as.numeric(samp_power$Sub_metering_3)

samp_power$dt_time <- paste(samp_power$Date,samp_power$Time)

samp_power$dt_time <- strptime(samp_power$dt_time, format = "%d/%m/%Y %H:%M:%S")

plot(samp_power$dt_time,samp_power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub meeting")
with(samp_power, lines(dt_time, Sub_metering_1))
with(samp_power, lines(dt_time, Sub_metering_2, col = "red"))
with(samp_power, lines(dt_time, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, "./ExData_Plotting1/plot3.png")
