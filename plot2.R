
# Course Project 1: Plot 2 ------------------------------------------------

househodpower <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
samp_power <- subset(househodpower, househodpower$Date == "1/2/2007" | househodpower$Date == "2/2/2007")

rm(househodpower)

str(samp_power)
samp_power$Global_active_power <- as.numeric(samp_power$Global_active_power)

samp_power$dt_time <- paste(samp_power$Date,samp_power$Time)

samp_power$dt_time <- strptime(samp_power$dt_time, format = "%d/%m/%Y %H:%M:%S")
with(samp_power, plot(dt_time, Global_active_power, type = "l", 
                      xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "./ExData_Plotting1/plot2.png")
dev.off()