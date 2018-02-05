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

###Plot 1
par(mfrow  = c(1,1))

with (
  
  data1
  ,hist(Global_active_power
        ,xlab = "Gloabl Active Power (kilowatts)"
        ,ylab = "Frequency"
        ,col = "red"
        ,main = "Global Active Power"
  )
  
)
dev.copy(png, file ="plot1.png", height = 480, width = 480)
dev.off()