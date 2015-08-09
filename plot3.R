
# Reading the dataset into a data frame
data_power <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      stringsAsFactors=F)

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

# Filtering the dataset only for the specified dates
data <- subset(data_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Saving Plot 3 as PNG File
png("plot3.png",height=480, width=480)

# Drawing Plot 3
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy Sub Metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, lwd=1)


dev.off()