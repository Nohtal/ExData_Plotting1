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


png('plot2.png')
#creating plot 2
days$Date<-format(days$Date,"%A %B %Y")
bdays = c('Thu','Fri','Sat')
plot(days$Global_active_power,type ='l',xaxt ='n',ylab = 'Global Active Power (kilowatts)')
axis(1,at = c(0,1500,2880),length(days$Date),labels = bdays)
dev.off()
