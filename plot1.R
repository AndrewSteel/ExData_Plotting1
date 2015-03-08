## plot1
## load dataset from household_power_consumption.txt and create a histogramm in png-format
## for the Global Active Power in the time from 2007-02-01 to 2007-02-02.

plot1 <- function(){
    data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007");
    data$datetime <- paste(data$Date, data$Time)
    data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S");
    png("plot1.png");
    hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power");
    dev.off();
}