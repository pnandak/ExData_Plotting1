#Setting the directory Path
setwd("G:\\Coursera\\Data_Science_Specialisation\\Quiz")

# Import the dataset into R
full_data <- read.table(file="household_power_consumption.txt",header=T, sep=';', na.strings="?",
                        stringsAsFactors=F, comment.char="")
str(full_data)
sapply(full_data,class)
full_data$Date <- as.Date(full_data$Date,format="%d/%m/%Y")

# Subset the data for specific date periods
data <- subset(full_data,(full_data$Date >="2007-02-01" & full_data$Date <="2007-02-02"))

#Create DateTime field
datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(datetime)

#plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l",
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.60)
    plot(Global_reactive_power~Datetime, type="l",
         ylab="Global_reactive_power",xlab="datetime")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()