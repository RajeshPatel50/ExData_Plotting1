#load dplyr package
library(dplyr)

#read data file
powerconsmp <- read.delim("data/household_power_consumption.txt", sep=";" ,header = TRUE)


#subset data based on date criteria

powerconsmp_range <- subset(powerconsmp,as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02") )

# build x axis
x.axis <- with(powerconsmp_range , as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename="plot4.png")

par(mfrow=c(2,2))

# in row1 and col1
plot(x.axis , as.numeric(powerconsmp_range$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type="l")
# in row2 and col2
plot(x.axis , as.numeric(powerconsmp_range$Voltage), xlab="datetime", ylab="Voltage", type="l")

# in row2 and col1
plot(x.axis , as.numeric(powerconsmp_range$Sub_metering_1), xlab="", ylab="Energy sub metring", type="l",  col="black")
lines(x.axis, as.numeric(powerconsmp_range$Sub_metering_2), col="red" )
lines(x.axis, as.numeric(powerconsmp_range$Sub_metering_3),  col="blue" )
legend("topright",
       c("Submetring_1","Submetring_2", "Submetring_3"),
       fill=c("black", "red","blue" ))

# in row2 and col2

plot(x.axis , as.numeric(powerconsmp_range$Global_reactive_power), xlab="datetime", ylab="Global Reactive Power", type="l")

title(main="Plot4")

dev.off()