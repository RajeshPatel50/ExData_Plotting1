#load dplyr package
library(dplyr)

#read data file
powerconsmp <- read.delim("data/household_power_consumption.txt", sep=";" ,header = TRUE)


#subset data based on date criteria

powerconsmp_range <- subset(powerconsmp,as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02") )

# build x axis
x.axis <- with(powerconsmp_range , as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename="plot2.png",  width = 480, height = 480, units = "px")

plot(x.axis , as.numeric(powerconsmp_range$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l", main="plot2")


dev.off()