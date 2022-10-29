require(lubridate)

fixed_data<- read.csv("./data/fixeddata.csv")

fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

plot(fixed_data$Datetime, fixed_data$Sub_metering_1, 
     type = "S",col = "black", ylab = "Energy sub metering",
     xlab = "")
lines(fixed_data$Datetime, fixed_data$Sub_metering_2, col = "red")
lines(fixed_data$Datetime, fixed_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png", width = 480)
dev.off()
