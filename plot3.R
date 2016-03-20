## Read all data. Note flag stringsAsFactors = FALSE
Data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
date <- as.Date(Data$Date, format = "%d/%m/%Y")
## Select data for two days in February
select <- date == "2007-02-02" | date == "2007-02-01"
Data <- Data[select,]
## Get variables to be plotted
sm1 <- as.numeric(Data$Sub_metering_1)
sm2 <- as.numeric(Data$Sub_metering_2)
sm3 <- as.numeric(Data$Sub_metering_3)
## Get right attributes for the time variable
date <- as.Date(Data$Date, format = "%d/%m/%Y")
date <- as.POSIXlt(date)
time <- strptime(Data$Time, format = "%H:%M:%S")
attr(time,"tzone") <- attributes(date)$tzone
time$year <- date$year
time$mon <- date$mon
time$yday <- date$yday
time$mday <- date$mday
time$wday <- date$wday
## Plot
par(bg = "white")
plot(time,sm1, type = "n", xlab = "", ylab = "Energy sub metering", main = "")
lines(time, sm1, col = "black")
lines(time, sm2, col = "red")
lines(time, sm3, col = "blue")
legend("topright", lwd = 1, cex = 0.8, y.intersp = 1, text.width = strwidth("Sub_metering_1"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Move plot to png device
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()