install.packages("sqldf")
library(sqldf)
file_path <- "C:/Users/HP/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
query <- "SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')"
data <- read.csv.sql(file_path, sql = query, sep = ";", header = TRUE)
closeAllConnections()

data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot1.R
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
