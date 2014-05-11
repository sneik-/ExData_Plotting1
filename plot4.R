plot4 <- function(){
## reading data

data <- read.csv2("household_power_consumption.txt", dec=".", colClasses = c("character", "character", rep("numeric",7)), na.strings="?")

## subsetting

df_february <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
rm(data)

## timeseries
x <- strptime(paste(df_february$Date,df_february$Time), format="%d/%m/%Y %H:%M:%S")

## plot 4
png(file="plot4.png")
par(mfcol=c(2,2))

#### 1st subplot

with(df_february, plot(x,Global_active_power, type="l", xlab="", ylab="Global Active Power"))
title(xlab=NULL)

#### 2nd subplot

with(df_february, {
  plot(x,df_february$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(x,df_february$Sub_metering_2, type="l", col="red")
  lines(x,df_february$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=c(1,1), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lwd = 0)
})

#### 3rd subplot

with(df_february, {
  plot(x,Voltage,type="l",xlab="datetime",ylab="Voltage")
})

#### 4th subplot

with(df_february, {
  plot(x,Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive power")
})
dev.off()
}