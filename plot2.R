
# Reading the dataset into a data frame
data_power <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      stringsAsFactors=F)

data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")

# Filtering the dataset only for the specified dates
data <- subset(data_power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Saving Plot 2 as PNG File
png("plot2.png",height=480, width=480)

# Drawing Plot 2
plot(data$Global_active_power~data$Datetime, 
     type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()