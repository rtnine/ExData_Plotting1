#
# plot1.R
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

# Create graph
png("plot1.png", width=480, height=480)
hist(as.numeric(feb_subset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()