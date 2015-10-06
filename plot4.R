data=read.csv('household_power_consumption.txt',sep=';',dec='.',na.strings = c("?",""),header=T)
data$Date=as.Date(data$Date , format='%d/%m/%Y')
head(data)
data_crop=subset(data,Date>="2007-02-01" & Date<="2007-02-02")
data_crop$timetemp <- paste(data_crop$Date, data_crop$Time)
data_crop$Time <- strptime(data_crop$timetemp, format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "C")

png(filename = 'plot4.png')
par(mfrow=c(2,2))

plot(data_crop$Time,data_crop$Global_active_power, main ='',ylab ='Global Active Power' ,xlab='',type='l')

plot(data_crop$Time,data_crop$Voltage, main ='',ylab ='Global Active Power' ,xlab='datetime',type='l')

plot(data_crop$Time,data_crop$Sub_metering_1, main ='',ylab ='Energy sub metering' ,xlab='',type='l')
lines(data_crop$Time,data_crop$Sub_metering_2, col='red')
lines(data_crop$Time,data_crop$Sub_metering_3, col='blue')
legend('topright',c("Sub metering 1", "Sub metering 2", "Sub metering 3"),bty = "n",lty=c(1,1),col=c("black","blue","red"))

plot(data_crop$Time,data_crop$Global_reactive_power, main ='',ylab ='Global_reactive_power' ,xlab='datetime',type='l')

dev.off()
