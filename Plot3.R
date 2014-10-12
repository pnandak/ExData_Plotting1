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

#Plot 3
with(data, {
    plot(data$Sub_metering_1~data$Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(data$Sub_metering_2~data$Datetime,col='Red')
    lines(data$Sub_metering_3~data$Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=, lwd=c(2,2,2),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=.70)

## Saving plot3 to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
