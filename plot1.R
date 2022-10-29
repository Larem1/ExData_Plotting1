dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "./data/dat_elec.zip")
unzip("./data/dat_elec.zip",exdir = "./data")

library(tidyverse)

elec_data <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
glob_power <- elec_data %>% subset(Global_active_power != "?") %>%
  mutate(Global_active_power = as.numeric(Global_active_power),
         Date = strptime(Date, "%d/%m/%Y"),
         Datetime = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")) %>%
  filter(Date <= "2007-2-2" & Date >="2007-2-1")

write.csv(glob_power, file = "./data/fixeddata.csv", row.names = FALSE)

hist(glob_power$Global_active_power, 
     breaks = 24, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, file = "plot1.png", width = 480)
dev.off()
