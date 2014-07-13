setwd("E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\")
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
DF<-data.frame(x)

library(sqldf)
SQ<-sqldf("select * FROM DF WHERE Date in ('1/2/2007','2/2/2007')")

Day <- as.POSIXct(strptime(paste(SQ$Date, SQ$Time), "%d/%m/%Y %H:%M:%S"))  

par(mfcol=c(2,2))

plot(Day,SQ$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Day,SQ$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(Day,SQ$Sub_metering_2,type="l", ylab="Energy sub metering", xlab="", col="red")
lines(Day,SQ$Sub_metering_3,type="l", ylab="Energy sub metering", xlab="", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)

plot(Day,SQ$Voltage,type="l", ylab="Voltage", xlab="datetime")
plot(Day,SQ$Global_reactive_power,type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime")

png(filename="E:\\IT\\DataSciense\\Data_Exploratory\\RawData\\plot4.png", height=480, width=480,bg="white")
