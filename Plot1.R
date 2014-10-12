#Setting the directory Path
setwd("G:\\Coursera\\Data_Science_Specialisation\\Quiz")

# Import the dataset into R
full_data <- read.table(file="household_power_consumption.txt",header=T, sep=';', na.strings="?",
                   stringsAsFactors=F, comment.char="")
str(full_data)
sapply(full_data,class)
full_data$Date <- as.Date(full_data$Date,format="%d/%m/%Y")

# Subset the data for specific date periods
data <- subset(full_data,(full_data$Date >="2007-02-01" & full_data$Date >="2007-02-02"))

#Create DateTime field
datetime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot 1: Create the Histogram for Global Active Power
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",xlim=c(0,6))

# save the Plot to a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
