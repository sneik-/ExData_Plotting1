plot2 <- function(){
## reading data

data <- read.csv2("household_power_consumption.txt", dec=".", colClasses = c("character", "character", rep("numeric",7)), na.strings="?")

## subsetting

df_february <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
rm(data)

## timeseries
x <- strptime(paste(df_february$Date,df_february$Time), format="%d/%m/%Y %H:%M:%S")

## plot 2
png(file="plot2.png")
with(df_february, plot(x,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

}