## Read all data. Note flag stringsAsFactors = FALSE
Data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
date <- as.Date(Data$Date, format = "%d/%m/%Y")
## Select data for two days in February
select <- date == "2007-02-02" | date == "2007-02-01"
Data <- Data[select,]
## Get plotting variables
gap <- as.numeric(Data$Global_active_power)
## Plot
par(bg = "white")
hist(gap, col = "red", cex = 0.5, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
## Move plot to png device
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()