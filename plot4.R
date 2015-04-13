dataj <-read.table('household_power_consumption.txt',header = TRUE,sep = ";",na.strings = "?")
attach(dataj)
names(dataj)
head(dataj)

data<-dataj[complete.cases(dataj),]

data$Date<-as.Date(data$Date,"%d/%m/%Y")


thursday<-(data$Date=="2007-02-01")
friday<-(data$Date=="2007-02-02")
t.data<-data[thursday,]
f.data<-data[friday,]
days<-rbind(t.data,f.data)


png('plot4.png')
#creating plot 4

par(mfrow = c(2,2))

days$Date<-format(days$Date,"%A %B %Y")
bdays = c('Thu','Fri','Sat')
plot(days$Global_active_power,type ='l',xaxt ='n',ylab = 'Global Active Power (kilowatts)',xlab = '')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)

plot(days$Voltage,type ='l',xaxt ='n',ylab = 'Voltage',xlab = 'datetime')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)

plot(days$Sub_metering_1,type ='l',xaxt ='n',ylab = 'Global Active Power (kilowatts)',xlab = '')
lines(days$Sub_metering_2,xaxt = 'n',col= 'red')
lines(days$Sub_metering_3,xaxt = 'n',col = 'blue')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)
legend('topright',lty = c(1,1,1),
       col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

plot(days$Global_reactive_power,type ='l',xaxt ='n',ylab = 'Global_reactive_power',xlab = 'datetime')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)
dev.off()
