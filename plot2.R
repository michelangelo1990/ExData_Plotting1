data=read.csv('household_power_consumption.txt',sep=';',dec='.',na.strings = c("?",""),header=T)
data$Date=as.Date(data$Date , format='%d/%m/%Y')
head(data)
data_crop=subset(data,Date>="2007-02-01" & Date<="2007-02-02")
data_crop$timetemp <- paste(data_crop$Date, data_crop$Time)
data_crop$Time <- strptime(data_crop$timetemp, format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "C")

png(filename = 'plot2.png')
plot(data_crop$Time,data_crop$Global_active_power, main ='',ylab ='Global Active Power (kilowatts)' ,xlab='',type='l')
dev.off()
