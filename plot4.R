require(lubridate)

fixed_data<- read.csv("./data/fixeddata.csv")

fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

par(mfrow = c(2,2))

plot(fixed_data$Datetime, fixed_data$Global_active_power, 
     type = "S", ylab = "Global Active Power",
     xlab = "")

with(fixed_data,plot(Datetime, Voltage, type= "S", xlab = "datetime"))

plot(fixed_data$Datetime, fixed_data$Sub_metering_1, 
     type = "S",col = "black", ylab = "Energy sub metering",
     xlab = "")
lines(fixed_data$Datetime, fixed_data$Sub_metering_2, col = "red")
lines(fixed_data$Datetime, fixed_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

with(fixed_data, plot(Datetime, Global_reactive_power, type = "S", xlab = "datetime"))

dev.copy(png, file = "plot4.png", width = 480)
dev.off()
