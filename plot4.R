setwd("./ExploratoryDataAnalysis")
dataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",dec ="."
                      ,colClasses = c("character"
                                      , "character"
                                      ,"numeric"
                                      ,"numeric"
                                      ,"numeric"
                                      ,"numeric"
                                      ,"numeric"
                                      ,"numeric"
                                      ,"numeric"), na.strings = "?")

data1 <- subset(dataSet, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

##Plot4
png("plot4.png", width=480, height=480)
par(mfrow  = c(2,2),mar=c(4,4,2,1),oma=c(0,1,0,0))

plot(data1$Datetime, data1$Global_active_power,type="l", xlab = "",ylab="Global Active Power",cex=0.2)

plot(data1$Datetime, data1$Voltage,type="l", xlab = "datatime",ylab="Voltage")

plot (data1$Datetime,data1$Sub_metering_1 ,col = "black" ,type ="l" ,xlab = "" ,ylab = "Energy sub metering")
lines(data1$Datetime ,data1$Sub_metering_2 ,col = "red")
lines(data1$Datetime ,data1$Sub_metering_3 ,col = "blue")
legend("topright" ,col = c("black","red","blue") ,lty = 1  ,lwd = 2.5, bty ="n"
       ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data1$Datetime ,data1$Global_reactive_power ,type ="l" ,xlab = "datetime" ,ylab = "Global_reactive_power")
##dev.copy(png, file ="plot4.png", height = 480, width = 480)
dev.off()