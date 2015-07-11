## if "lubridate" package is not installed already, install it
if (!"lubridate" %in% installed.packages()){ install.packages("lubridate")} 
library(lubridate)

## Read in the data
epc <- read.table(file="household_power_consumption.txt", 
                  sep=";", header=TRUE, na.strings=c("?"))

## subset only the 2 days we are interested in
req_Data <- subset(epc, epc$Date == '1/2/2007' |epc$Date == '2/2/2007', select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
Updated_rd <- cbind(req_Data, DateTime = dmy(req_Data$Date) + hms(req_Data$Time))
## Open the png device
png(filename="plot3.png")

## Plot Energy_submetering_1
with(Updated_rd, 
     plot(DateTime, 
          Sub_metering_1, 
          type="l",
          xlab="",
          ylab="Energy sub metering"))

## Plot Energy_submetering_2
with(Updated_rd, 
     lines(DateTime, 
           Sub_metering_2, 
           type="l",
           col="red"))
     
## Plot Energy_submetering_3
with(Updated_rd, 
       lines(DateTime, 
       Sub_metering_3, 
       type="l",
       col="blue"))
       
## Legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2 ", "Sub_metering_3"),
       lty = c(1,1, 1), 
       col=c("black", "red", "blue"))

## close the Graphics device
dev.off()