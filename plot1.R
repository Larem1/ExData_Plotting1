# create data directory
dir.create("./data")

# download the zip file to data directory as "dat_elec.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "./data/dat_elec.zip")

# unzip data to data directory
unzip("./data/dat_elec.zip",exdir = "./data")

# load required packages
library(tidyverse, lubridate)

# read in the data 
elec_data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)

# fix the data
glob_power <- elec_data %>% 
  subset(Global_active_power != "?") %>% # remove the "?" of missing values
  mutate(Global_active_power = as.numeric(Global_active_power), # change Global_active_power to numeric
         Date = strptime(Date, "%d/%m/%Y"),  # change the Date column with strptime (dont think this step was necessary with the next step)
         Datetime = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")) %>% # create a Datetime by combining Date and Time columns in posixct
  filter(Date <= "2007-2-2" & Date >="2007-2-1") #only dates in 2007-2-1 and 2007-2-2

# write the fixed data to data directory as fixeddata.csv to use in other plot#.R
write.csv(glob_power, file = "./data/fixeddata.csv", row.names = FALSE)

# create the histogram 
hist(glob_power$Global_active_power, 
     breaks = 24, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# save the plot as png file with width 480 pixels
dev.copy(png, file = "plot1.png", width = 480)
dev.off()
