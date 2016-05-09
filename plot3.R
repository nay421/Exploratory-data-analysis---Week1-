#Load  Electric power consumption dataset

epc <- read.table('household_power_consumption.txt', sep = ';', header=TRUE, stringsAsFactors = FALSE, dec='.', na.strings = '?')


#Subset the date to include only dates 2007-02-01 and 2007-02-02

epc_sub <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

#Convert the date and time column to the right format

epc_sub$DT <- paste(epc_sub$Date, epc_sub$Time, sep = " ")
library(lubridate)
epc_sub$DT <- dmy_hms(epc_sub$DT)
DT <- epc_sub$DT


#Plot 


DT <- epc_sub$DT
sub1 <- epc_sub$Sub_metering_1
sub2 <- epc_sub$Sub_metering_2
sub3 <- epc_sub$Sub_metering_3

png('plot9.png', width=480, height=480)
plot(DT, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(DT, sub2, type="l", col = 'red')
lines(DT, sub3, type = 'l', col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
