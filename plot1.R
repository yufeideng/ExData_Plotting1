
# Week1_Course_Project:Plot 1  -------------------------------------------------

if(!file.exists("./data")) {dir.create("./data")}

# Download data

dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataurl, "./data/data1.zip", "curl")

unzip(zipfile = "./data/data1.zip", exdir = "./data")
file.remove("./data/data1.zip")

# Load data 

househodpower <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")
samp_power <- subset(househodpower, househodpower$Date == "1/2/2007" | househodpower$Date == "2/2/2007")

rm(complete)

str(samp_power)
samp_power$Global_active_power <- as.numeric(samp_power$Global_active_power)

with(samp_power, hist(Global_active_power, col = "red", 
                      xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, "./ExData_Plotting1/plot1.png")
dev.off()
