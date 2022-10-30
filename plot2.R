# load required packages
require(lubridate, tidyverse)

# read in the data created in plot1.R
fixed_data<- read.csv("./data/fixeddata.csv")

# fix Datetime column to actually be Datetime class
fixed_data <- fixed_data %>%
  mutate(Datetime = as.POSIXct(Datetime, format = "%Y-%m-%d %H:%M:%S"))

# create the desired plot 
plot(fixed_data$Datetime, fixed_data$Global_active_power, 
     type = "S", ylab = "Global Active Power (kilowatts)",
     xlab = "")

# save the plot as png file with width 480 pixels
dev.copy(png, file = "plot2.png", width = 480)
dev.off()
