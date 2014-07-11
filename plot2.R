setwd("E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\")
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DF<-data.frame(x)

library(sqldf)
SQ<-sqldf("select * FROM DF WHERE Date in ('1/2/2007','2/2/2007')")

Day <- as.POSIXct(strptime(paste(SQ$Date, SQ$Time), "%d/%m/%Y %H:%M:%S"))  
plot(Day,SQ$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
