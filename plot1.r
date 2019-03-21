final <- readr::read_csv2("household_power_consumption.txt", na = c("", "NA", "?"))

final <- final[final$Date %in% c("1/2/2007","2/2/2007"),]

final <- readr::type_convert(final)

final$date_time <- strptime(  paste(final$Date,final$Time),  format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width=480, height=480)
hist(final$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()