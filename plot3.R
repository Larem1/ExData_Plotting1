# load required packages
require(lubridate, tidyverse)

# read in the data created in plot1.R
fixed_data<- read.csv("./data/fixeddata.csv")

# fix Datetime column to actually be Datetime class
fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

# create the desired plot for the first line of sub metering 1
plot(fixed_data$Datetime, fixed_data$Sub_metering_1, 
     type = "S",col = "black", ylab = "Energy sub metering",
     xlab = "")

# add the second line for submetering 2
lines(fixed_data$Datetime, fixed_data$Sub_metering_2, col = "red")

# add the third line for submetering 3 
lines(fixed_data$Datetime, fixed_data$Sub_metering_3, col = "blue")

#add the legend for all three lines
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# save the plot as png file with width 480 pixels
dev.copy(png, file = "plot3.png", width = 480)
dev.off()
