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

epc_sub$Global_active_power<-as.numeric(epc_sub$Global_active_power)
DT <- epc_sub$DT
gap <- epc_sub$Global_active_power
png('plot2.png', width=480, height=480)
plot(DT, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
