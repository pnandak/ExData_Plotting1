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

#Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Savinf Plot2 to a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()