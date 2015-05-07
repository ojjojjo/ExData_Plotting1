# load clean data
load("data.clean.RData")

# line graph for sub_meters
head(data.clean)

# clean up openned graphic devices
graphics.off()


png("plot3.png", width = 480, height = 480, units = "px")
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
    )
) # gives the legend lines the correct color

dev.off()
