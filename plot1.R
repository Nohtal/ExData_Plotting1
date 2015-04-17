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


png('plot1.png', width = 480, height = 480)
#creating plot 1
hist(days$Global_active_power,col = 'red',xlab = 'Global Active Power (kilowatts)',main = "Global Active Power")
dev.off()
