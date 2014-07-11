setwd("E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\")
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DF<-data.frame(x)

library(sqldf)
SQ<-sqldf("select * FROM DF WHERE Date in ('1/2/2007','2/2/2007')")

Day <- as.POSIXct(strptime(paste(SQ$Date, SQ$Time), "%d/%m/%Y %H:%M:%S"))  
plot(Day,SQ$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(Day,SQ$Sub_metering_2,type="l", ylab="Energy sub metering", xlab="", col="red")
lines(Day,SQ$Sub_metering_3,type="l", ylab="Energy sub metering", xlab="", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)

