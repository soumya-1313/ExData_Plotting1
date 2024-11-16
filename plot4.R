library(sqldf)
file_path <- "C:/Users/HP/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
query <- "SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')"
data <- read.csv.sql(file_path, sql = query, sep = ";", header = TRUE)
closeAllConnections()

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#plot4.R
par(mfrow = c(2, 2))

# Top-left: Global Active Power
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Top-right: Voltage
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom-left: Sub Metering
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Bottom-right: Global Reactive Power
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
