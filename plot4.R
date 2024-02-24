library(tidyverse)

setwd("C:/Users/BusinessTim/Desktop/desktop files/Coursera/Course4/ass1/data/")


ass1.data<- read_delim("household_power_consumption.txt", 
                       delim = ";", escape_double = FALSE, trim_ws = TRUE) %>%
  mutate(Date=as.Date(Date, format='%d/%m/%Y')) %>%
  filter(Date>='2007-02-01' & Date <='2007-02-02') %>%
  mutate(date.time=paste(Date, Time, sep=' '), 
         date.time=as_datetime(date.time)) %>%
  mutate(Global_active_power=as.numeric(Global_active_power),
         Sub_metering_1=as.numeric(Sub_metering_1),
         Sub_metering_2=as.numeric(Sub_metering_2),
         Sub_metering_3=as.numeric(Sub_metering_3),
         Voltage=as.numeric(Voltage),
         Global_reactive_power=as.numeric(Global_reactive_power))


glimpse(ass1.data)

setwd("C:/Users/BusinessTim/Desktop/desktop files/Coursera/Course4/ass1/ExData_Plotting1/")

plot.new()

png("Plot4.png", width=480, height=480)

par(mfrow=c(2,2))

### upper left

plot(type='l',
     lty=1,
     xaxt='n',
     x=ass1.data$date.time,
     y=ass1.data$Global_active_power, 
     xlab='',
     ylab='Global Active Power')
axis(1, at=pretty(ass1.data$date.time, n=2), labels=c("Thu", "Fri", "Sat"))  

### upper right

plot(type='l',
     lty=1,
     xaxt='n',
     x=ass1.data$date.time,
     y=ass1.data$Voltage, 
     xlab='datetime',
     ylab='Voltage')
axis(1, at=pretty(ass1.data$date.time, n=2), labels=c("Thu", "Fri", "Sat"))  

### lower left
plot(type='l',
     lty=1,
     xaxt='n',
     x=ass1.data$date.time,
     y=ass1.data$Sub_metering_1,
     col=1,
     xlab='',
     ylab='Energy sub metering')
lines(x=ass1.data$date.time,
      y=ass1.data$Sub_metering_2,
      col=2)
lines(x=ass1.data$date.time,
      y=ass1.data$Sub_metering_3,
      col=4)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c(1,2,4), lty = 1, cex=0.8)
axis(1, at=pretty(ass1.data$date.time, n=2), labels=c("Thu", "Fri", "Sat"))  

### lower right

plot(type='l',
     lty=1,
     xaxt='n',
     x=ass1.data$date.time,
     y=ass1.data$Global_reactive_power, 
     xlab='datetime',
     ylab='Global_reactive_power')
axis(1, at=pretty(ass1.data$date.time, n=2), labels=c("Thu", "Fri", "Sat"))  



dev.off() 




