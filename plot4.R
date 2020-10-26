url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile="./hpc.zip"
datafile="./household_power_consumption.txt"
if (!file.exists(datafile)){
  if (!file.exists(zipfile)){
    download.file(url,zipfile)
  }
  unzip(zipfile)
}

data=read.table(datafile,sep=";",header=TRUE)
data$Date=as.Date(data$Date,format="%d/%m/%Y")
data=subset(data,(data$Date==as.Date("2007-02-01"))|(data$Date==as.Date("2007-02-02")))

dt=strptime(with(data,paste(Date,as.character(Time))),"%Y-%m-%d %H:%M:%S")

gap=as.numeric(as.character(data$Global_active_power))

volt=as.numeric(as.character(data$Voltage))

submet1=as.numeric(as.character(data$Sub_metering_1))
submet2=as.numeric(as.character(data$Sub_metering_2))
submet3=as.numeric(as.character(data$Sub_metering_3))

grp=as.numeric(as.character(data$Global_reactive_power))

png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(dt,gap,xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(dt,volt,xlab="datetime",ylab="Voltage",type="l")
plot(dt,submet1,type="l",xlab="",ylab="Energy sub metering")
lines(dt,submet2,col="red")
lines(dt,submet3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
plot(dt,grp,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
