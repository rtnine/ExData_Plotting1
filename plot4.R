#
# plot4.R
#
# Written by Robert Nine
# For Coursera Exploratory Data Analysis Course
# 7 Feb 2016

# Check to see if data directory exists. If not, create it
if(!file.exists("./data")){dir.create("./data")}

# Check to see if data file exists. If not, download it and unzip it
if(!file.exists("./data/household_power_consumption.zip")){fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip";
download.file(fileUrl,destfile="./data/household_power_consumption.zip");
unzip("./data/household_power_consumption.zip",exdir="./data")}

# Read input data and extract subset for Feb 1 an 2
input_data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
feb_subset <- input_data[input_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Reformat the date and time
change_date_time <- strptime(paste(feb_subset$Date, feb_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(change_date_time, as.numeric(feb_subset$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(change_date_time, as.numeric(feb_subset$Voltage), type="l", xlab="datetime", ylab="Voltage")
plot(change_date_time, as.numeric(feb_subset$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(change_date_time, as.numeric(feb_subset$Sub_metering_2), type="l", col="red")
lines(change_date_time, as.numeric(feb_subset$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"), bty="n")
plot(change_date_time, as.numeric(feb_subset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()