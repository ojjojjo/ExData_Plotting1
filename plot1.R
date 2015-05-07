# plot1
if (!require("data.table")) install.packages("data.table")
library("data.table")

#====== import data =====
setwd("./ExData/Project1/ExData_Plotting1/")
data1 <- 
  fread(
    "/Users/JianJin/Downloads/household_power_consumption.txt",
    header = TRUE, 
    na.strings = c("?")
  )

# select data fro 02/01/2007 and 02/02/2007 (No keys set for subsetting)

setkey(data1, Date)
tables()

dataSubset <- data1[c("1/2/2007", "2/2/2007"),]

rm(data1)

dataSubset <- 
  cbind(
    dataSubset[, 1:2, with=FALSE], 
    dataSubset[, lapply(.SD[, 3:9, with=FALSE], 
                        as.numeric)]
  )

# check missing values
str(dataSubset)
sapply(dataSubset, function(x) sum(is.na(x)))
sapply(dataSubset, unique)


unique(dataSubset$Sub_metering_3)
sum(is.na(dataSubset$Sub_metering_3))
unique(dataSubset$Global_intensity)

#====== data cleaning =======
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss

DateTime <- strptime(
  paste(
    dataSubset$Date, 
    dataSubset$Time, sep = " "
  ),
  "%d/%m/%Y %T"
)
data.clean.tmp <- data.frame(dataSubset, DateTime)
data.clean <- data.clean.tmp[, -c(1:2)]
head(data.clean)
str(data.clean)

# ==== save clean data ====
save(data.clean, file = "data.clean.RData")


# ===== plotting ====

# clean up openned graphic devices
graphics.off()


# plotting histogram
png("plot1.png", width = 480, height = 480, units = "px")

hist(
  data.clean$Global_active_power,
  xlab="Global Active Power (kilowatts)",
  ylab="Frequency",
  main = "Global Active Power",
  col = "red"
)

dev.off()

