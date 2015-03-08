## plot4
## load dataset from household_power_consumption.txt and create four plots in one png-file
## for
##    * datetime and Global_active_power
##    * datetime and Voltage
##    * datetime and Sub_metering one to three
##    * datetime and Global_reactive_power
## all in the time from 2007-02-01 to 2007-02-02.

plot4 <- function(){
    data <- subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007");
    data$datetime <- paste(data$Date, data$Time)
    data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S");
    Sys.setlocale("LC_TIME", "en_US.UTF-8");
    png("plot4.png");
    par(mfrow = c(2,2));
    with(data, {
      plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power");
      plot(datetime, Voltage, type="l");
      plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");
      points(datetime, Sub_metering_2, col="red", type="l");
      points(datetime, Sub_metering_3, col="blue", type="l");
      legend("topright", bty="n", pch=NA, lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
      plot(datetime, Global_reactive_power, type="l");
    });
    dev.off();
}