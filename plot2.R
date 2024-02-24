library(tidyverse)

setwd("C:/Users/BusinessTim/Desktop/desktop files/Coursera/Course4/ass1/data/")


ass1.data<- read_delim("household_power_consumption.txt", 
                       delim = ";", escape_double = FALSE, trim_ws = TRUE) %>%
  mutate(Date=as.Date(Date, format='%d/%m/%Y')) %>%
  filter(Date>='2007-02-01' & Date <='2007-02-02') %>%
  mutate(date.time=paste(Date, Time, sep=' '), 
         date.time=as_datetime(date.time)) %>%
  mutate(Global_active_power=as.numeric(Global_active_power))


glimpse(ass1.data)

setwd("C:/Users/BusinessTim/Desktop/desktop files/Coursera/Course4/ass1/ExData_Plotting1/")


plot.new()

png("Plot2.png", width=480, height=480)

plot(type='l',
      lty=1,
     xaxt='n',
     x=ass1.data$date.time,
     y=ass1.data$Global_active_power, 
     xlab='',
     ylab='Global Active Power (kilowatts)')
axis(1, at=pretty(ass1.data$date.time, n=2), labels=c("Thu", "Fri", "Sat"))  

dev.off() 




