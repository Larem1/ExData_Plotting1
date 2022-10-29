require(lubridate)

fixed_data<- read.csv("./data/fixeddata.csv")

fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

plot(fixed_data$Datetime, fixed_data$Global_active_power, 
     type = "S", ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.copy(png, file = "plot2.png", width = 480)
dev.off()
