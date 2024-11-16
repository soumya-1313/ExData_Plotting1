library(sqldf)
file_path <- "C:/Users/HP/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
query <- "SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')"
data <- read.csv.sql(file_path, sql = query, sep = ";", header = TRUE)
closeAllConnections()

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#plot2.R
plot(data$Datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
