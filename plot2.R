## plot2
## load dataset from household_power_consumption.txt and create a line plot in png-format
## for the Global Active Power and datetime in the time from 2007-02-01 to 2007-02-02.

plot2 <- function(){
    data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007");
    data$datetime <- paste(data$Date, data$Time)
    data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S");
    Sys.setlocale("LC_TIME", "en_US.UTF-8");
    png("plot2.png");
    plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");
    dev.off();
}