final <- readr::read_csv2("household_power_consumption.txt", na = c("", "NA", "?"))

final <- final[final$Date %in% c("1/2/2007","2/2/2007"),]

final <- readr::type_convert(final)

final$date_time <- strptime(  paste(final$Date,final$Time),  format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width=480, height=480)
plot(final$date_time,final$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
lines(final$date_time,final$Sub_metering_2, col="red")
lines(final$date_time,final$Sub_metering_3, col="blue")
legend(x="topright",
       lty=1, lwd=2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue")
)
dev.off()