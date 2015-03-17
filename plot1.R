consum<-read.csv('./data/household_power_consumption.txt',colClass='character',sep=';')


con=subset(consum,Date=="1/2/2007"|Date=="2/2/2007")

rm(consum)


con[,3:9]=lapply(con[,3:9],as.numeric)
con$Date=as.Date(con$Date,'%d/%m/%Y') 
con$Time=strptime(paste(con$Date,con$Time),'%Y-%m-%d %H:%M:%S')




#plot png1
hist(con[,3],xlab='Global Active Power(kilowatts)',col='red',main='Global Active Power')
dev.copy(png,file='plot1.png',width=480,height=480)
dev.off()
