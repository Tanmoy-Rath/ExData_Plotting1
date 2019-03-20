final <- readr::read_csv2("household_power_consumption.txt", na = c("", "NA", "?"))

final <- final[final$Date %in% c("1/2/2007","2/2/2007"),]

final <- readr::type_convert(final)

final$date_time <- strptime(  paste(final$Date,final$Time),  format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width=480, height=480)
plot(final$date_time,final$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()