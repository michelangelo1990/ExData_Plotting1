data=read.csv('household_power_consumption.txt',sep=';',dec='.',header=T)
data$Date=as.Date(data$Date , format='%d/%m/%Y')
head(data)
data_crop=subset(data,Date>="2007-02-01" & Date<="2007-02-02")

png(filename = 'plot1.png')
hist(as.numeric(levels(data_crop$Global_active_power)[data_crop$Global_active_power]), col = 'red', main ='Global Active Power',xlab ='Global Active Power (kilowatts)' )
dev.off()
