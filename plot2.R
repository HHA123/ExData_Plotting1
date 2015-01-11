
plot2 <- function(){

        data <- read.csv("C:/Users/kan01/Documents/Rprogrammering/exp/household_power_consumption.txt",sep=";",na.strings="?")

        data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
        data$Date <-as.Date(data$Date, format="%d/%m/%Y")

        dat <- subset(data,(data$Date=="2007-02-02")| (data$Date=="2007-02-01"))

        Sys.setlocale("LC_TIME", "English")

        png(file="plot2.png",height=480, width = 480)
        with(dat,plot(dat$DateTime,dat$Global_active_power,type="n",ylab="Global Active Power(kilowatts)"))
        lines(dat$DateTime,dat$Global_active_power)
        dev.off()
}