## if "lubridate" package is not installed already, install it
if (!"lubridate" %in% installed.packages()){ install.packages("lubridate")} 
library(lubridate)

## Read in the data
epc <- read.table(file="household_power_consumption.txt", 
                  sep=";", header=TRUE, na.strings=c("?"))

## subset only the 2 days we are interested in
req_Data <- subset(epc, epc$Date == '1/2/2007' |epc$Date == '2/2/2007', select = c(Date, Time, Global_active_power))
Updated_rd <- cbind(req_Data, DateTime = dmy(req_Data$Date) + hms(req_Data$Time))

## Open the png device
png(filename="plot2.png")
##Plot the data

with(Updated_rd, 
     plot(DateTime, 
          Global_active_power, 
          type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)"))

## close the Graphics device
dev.off()