# load clean data
load("data.clean.RData")

# line graph for sub_meters
head(data.clean)
str(data.clean)

# clean up openned graphic devices
graphics.off()


# plot 4
png("plot4.png", width = 480, height = 480, units = "px")
op <- par(mfrow = c(2, 2), # 2 x 2 pictures on one plot
          pty = "s")       # square plotting region, independent of device size

# plot: Global_active_power
plot(data.clean$Global_active_power ~ data.clean$DateTime,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# plot: Voltage
plot(data.clean$Voltage ~ data.clean$DateTime,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot: Sub_metering
plot(
  data.clean$Sub_metering_1 ~ data.clean$DateTime,
  type = "n",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(
  data.clean$Sub_metering_1 ~ data.clean$DateTime
)

lines(
  data.clean$Sub_metering_2 ~ data.clean$DateTime, 
  col = "red"
)

lines(
  data.clean$Sub_metering_3 ~ data.clean$DateTime, 
  col = "blue"
)

legend(
  "topright", # places a legend at the appropriate place 
  
  c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ), # puts text in the legend 
  
  
  lty = 
    c(
      1,
      1,
      1
    ), # gives the legend appropriate symbols (lines)
  
  
  col = 
    c(
      "black",
      "red",
      "blue"
    ),
  bty = "n",  # no border 
  cex = 0.75  # smaller
) 


plot(data.clean$Global_reactive_power ~ data.clean$DateTime,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")

## At end of plotting, reset to previous settings:
par(op)
dev.off()
