# load clean data
load("data.clean.RData")

# clean up openned graphic devices
graphics.off()

# line graph for global active power

png("plot2.png", width = 480, height = 480, units = "px")

plot(data.clean$Global_active_power ~ data.clean$DateTime,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

