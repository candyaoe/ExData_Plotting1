consum<-read.csv('./data/household_power_consumption.txt',colClass='character',sep=';')


con=subset(consum,Date=="1/2/2007"|Date=="2/2/2007")

rm(consum)


con[,3:9]=lapply(con[,3:9],as.numeric)
con$Date=as.Date(con$Date,'%d/%m/%Y') 
con$Time=strptime(paste(con$Date,con$Time),'%Y-%m-%d %H:%M:%S')


#plot png4
par(mfrow=c(2,2))

#plot (1,1)
plot(con[,2],con[,3],xlab='',ylab='Global Active Power',type='l')

#plot (1,2)
plot(con[,2],con[,5],xlab='datetime',ylab='Voltage',type='l')

#plot (2,1)
plot(con[,2],con[,7],type='l',xlab='',ylab='Energy sub metering')
lines(con[,2],con[,8],col='red')
lines(con[,2],con[,9],col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)

#plot(2,2)
plot(con[,2],con[,4],type='l',xlab='datetime',ylab='Global_reactive_power')

dev.copy(png,file='plot4.png',width=480,height=480)
dev.off()
