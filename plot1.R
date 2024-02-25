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

png("Plot1.png", width=480, height=480)

hist(ass1.data$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (Kilowatts)', col='red')

dev.off() 







