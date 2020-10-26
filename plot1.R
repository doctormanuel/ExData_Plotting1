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

png("plot1.png",height=480,width=480)
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()