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

gap=as.numeric(as.character(data$Global_active_power))

dt=strptime(with(data,paste(Date,as.character(Time))),"%Y-%m-%d %H:%M:%S")

png("plot2.png",height=480,width=480)
plot(dt,gap,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
