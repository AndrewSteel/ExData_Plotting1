## plot3
## load dataset from household_power_consumption.txt and create a line plot in png-format
## for the datetime and the three Energy Sub-metering in the time from 2007-02-01 to 2007-02-02.

plot3 <- function(){
    data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007");
    data$datetime <- paste(data$Date, data$Time)
    data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S");
    Sys.setlocale("LC_TIME", "en_US.UTF-8");
    png("plot3.png");
    with(data, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"));
    with(data, points(datetime, Sub_metering_2, col="red", type="l"));
    with(data, points(datetime, Sub_metering_3, col="blue", type="l"));
    legend("topright", pch=NA, lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
    dev.off();
}