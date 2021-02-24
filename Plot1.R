#load dplyr package
library(dplyr)

#read data file
powerconsmp <- read.delim("data/household_power_consumption.txt", sep=";" ,header = TRUE)


#subset data based on date criteria

powerconsmp_range <- subset(powerconsmp,as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02") )


png(filename="plot1.png",  width = 480, height = 480, units = "px")

hist(as.numeric(powerconsmp_range$Global_active_power),col="red",xlab = "Global Active Power", ylab="Frequency", main="plot1")

dev.off()