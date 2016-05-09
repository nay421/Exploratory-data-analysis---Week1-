#Load  Electric power consumption dataset

epc <- read.table('household_power_consumption.txt', sep = ';', header=TRUE, stringsAsFactors = FALSE, dec='.')

#Inspect the data
head(epc)
str(epc)

#Subset the date to include only dates 2007-02-01 and 2007-02-02

epc_sub <- epc[epc$Date %in% c("1/2/2007","2/2/2007"),]



#Plot 

epc_sub$Global_active_power<-as.numeric(epc_sub$Global_active_power)

png('plot1.png', width=480, height=480)
with(epc_sub, hist(Global_active_power, col = 'red', xaxt = 'n', yaxt = 'n', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'))
axis (side = 1, at = c(0,2,4,6), labels = c(0,2,4,6))
axis (side = 2, at = c(0,200,400,600,800,1000,1200))
dev.off()
