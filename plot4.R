plot4 <- function(){
        
        data <- read.csv("C:/Users/kan01/Documents/Rprogrammering/exp/household_power_consumption.txt",sep=";",na.strings="?")
        data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
        data$Date <-as.Date(data$Date, format="%d/%m/%Y")
        
        dat <- subset(data,(data$Date=="2007-02-02")| (data$Date=="2007-02-01"))
        rm(data)
        Sys.setlocale("LC_TIME", "English")
        legendl <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        legendc <- c("black","red","blue")
        
        #creates a plot containing 4 plots
        png(file= "plot4.png",width=480,height=480)
        par(lwd=0.2,cex=0.5)
        par(mfcol = c(2,2))
        #First plot
        plot(dat$DateTime,dat$Global_active_power,type="n",ylab="Global Active Power(kilowatts)",xlab ="")
        lines(dat$DateTime,dat$Global_active_power)
        #Second
        plot(dat$DateTime,dat$Sub_metering_1,type="n",
                      xlab="",ylab="Energy metering",)
        lines(dat$DateTime,dat$Sub_metering_1,col="black")
        lines(dat$DateTime,dat$Sub_metering_2,col="red")
        lines(dat$DateTime,dat$Sub_metering_3,col="blue")
        legend("topright",col =legendc,legend =legendl,lty=1,
               bg = "transparent", box.col = "black",cex = 0.8 )
        #Third
        plot(dat$DateTime,dat$Voltage,xlab="datetime",ylab="Voltage",type ="n")
        lines(dat$DateTime,dat$Voltage,lwd=0.1)
        #Forth plot
        plot(dat$DateTime,dat$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
        lines(dat$DateTime,dat$Global_reactive_power)
        dev.off()
}