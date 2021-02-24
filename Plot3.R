#load dplyr package
library(dplyr)

#read data file
powerconsmp <- read.delim("data/household_power_consumption.txt", sep=";" ,header = TRUE)


#subset data based on date criteria

powerconsmp_range <- subset(powerconsmp,as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02") )

# build x axis
x.axis <- with(powerconsmp_range , as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename="plot3.png",  width = 480, height = 480, units = "px")

plot(x.axis , as.numeric(powerconsmp_range$Sub_metering_1), xlab="", ylab="Energy sub metring", type="l", main="plot3", col="black")

lines(x.axis, as.numeric(powerconsmp_range$Sub_metering_2), col="red" )
lines(x.axis, as.numeric(powerconsmp_range$Sub_metering_3),  col="blue" )
legend("topright",
       c("Submetring_1","Submetring_2", "Submetring_3"),
       fill=c("black", "red","blue" ))


dev.off()