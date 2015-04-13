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

png('plot3.png')
#creating plot 3
plot(days$Sub_metering_1,type ='l',xaxt ='n',ylab = 'Global Active Power (kilowatts)')
lines(days$Sub_metering_2,xaxt = 'n',col= 'red')
lines(days$Sub_metering_3,xaxt = 'n',col = 'blue')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)
legend('topright',lty = c(1,1,1),col = c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
