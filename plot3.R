library(sqldf)
file_path <- "C:/Users/HP/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
query <- "SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')"
data <- read.csv.sql(file_path, sql = query, sep = ";", header = TRUE)
closeAllConnections()

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#plot3.R
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
