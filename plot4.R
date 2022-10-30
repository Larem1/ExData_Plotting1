# load required packages
require(lubridate, tidyverse)

# read in the data created in plot1.R
fixed_data<- read.csv("./data/fixeddata.csv")

# fix Datetime column to actually be Datetime class
fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

# set the plot area to 2x2 
par(mfrow = c(2,2))

# create the first plot that will show up on the first column first row
plot(fixed_data$Datetime, fixed_data$Global_active_power, 
     type = "S", ylab = "Global Active Power",
     xlab = "")

# create second plot that will show up second column first row
with(fixed_data,plot(Datetime, Voltage, type= "S", xlab = "datetime"))

# create the desired plot that will show up first column second row (same as plot3.R)
plot(fixed_data$Datetime, fixed_data$Sub_metering_1, 
     type = "S",col = "black", ylab = "Energy sub metering",
     xlab = "")

# add the second line for submetering 2
lines(fixed_data$Datetime, fixed_data$Sub_metering_2, col = "red")

# add the third line for submetering 3
lines(fixed_data$Datetime, fixed_data$Sub_metering_3, col = "blue")

# add the legend for all three lines
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)


# create the fourth plot that will appear second column second row
with(fixed_data, plot(Datetime, Global_reactive_power, type = "S", xlab = "datetime"))

# save the plot as png file with width 480 pixels
dev.copy(png, file = "plot4.png", width = 480)
dev.off()
