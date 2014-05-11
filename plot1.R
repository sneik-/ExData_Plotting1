plot1 <- function(){
## reading data

data <- read.csv2("household_power_consumption.txt", dec=".", colClasses = c("character", "character", rep("numeric",7)), na.strings="?")

## subsetting

df_february <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
rm(data)

## plot 1
png(file="plot1.png")
hist(df_february$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()

}