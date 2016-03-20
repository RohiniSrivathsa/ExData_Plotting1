## Read all data. Note flag stringsAsFactors = FALSE
Data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
date <- as.Date(Data$Date, format = "%d/%m/%Y")
## Select data for two days in February
select <- date == "2007-02-02" | date == "2007-02-01"
Data <- Data[select,]
## Get variables to be plotted
gap <- as.numeric(Data$Global_active_power)
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
plot(time,gap, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
lines(time, gap)
## Move plot to png device
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()