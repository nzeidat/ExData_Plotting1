## plot1.R
## Read in the data
epc <- read.table(file="household_power_consumption.txt", 
                  sep=";", header=TRUE, na.strings=c("?"))

## subset only the 2 days we are interested in
required_data <- subset(epc, epc$Date == '1/2/2007' |epc$Date == '2/2/2007')

## Open the png device
png(filename="plot1.png")
##Plot the data
hist(required_data$Global_active_power, 
              col="red",
              main="Global Active Power",
              xlab="Global Active Power (kilowatts)",
              ylab="Frquency")
## close the Graphics device
dev.off()