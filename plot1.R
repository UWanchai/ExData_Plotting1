setwd("E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\")
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DF<-data.frame(x)

library(sqldf)
SQ<-sqldf("select * FROM DF WHERE Date in ('1/2/2007','2/2/2007')")
hist(SQ$Global_active_power, main="Global Active Power", col=c("red"), xlab="Global Active Power (kilowatts)")
png(filename="E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\plot1.png", height=480, width=480,bg="white")
