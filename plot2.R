consum<-read.csv('./data/household_power_consumption.txt',colClass='character',sep=';')


con=subset(consum,Date=="1/2/2007"|Date=="2/2/2007")

rm(consum)


con[,3:9]=lapply(con[,3:9],as.numeric)
con$Date=as.Date(con$Date,'%d/%m/%Y') 
con$Time=strptime(paste(con$Date,con$Time),'%Y-%m-%d %H:%M:%S')


#plot png2
plot(con[,2],con[,3],type='l',ylab='Global Active Power(kilowatts)',xlab='')
dev.copy(png,file='plot2.png',width=480,height=480)
dev.off()
