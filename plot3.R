plot3 <- function(){
        
        data <- read.csv("C:/Users/kan01/Documents/Rprogrammering/exp/household_power_consumption.txt",sep=";",na.strings="?")
        
        data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
        data$Date <-as.Date(data$Date, format="%d/%m/%Y")
        
        dat <- subset(data,(data$Date=="2007-02-02")| (data$Date=="2007-02-01"))
        rm(data)
        Sys.setlocale("LC_TIME", "English")
        
        legendl <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        legendc <- c("black","red","blue")
        
        png(file="plot3.png",height=480, width = 480)
        plot(dat$DateTime,dat$Sub_metering_1,type="n",
                           xlab="",ylab="Energy metering",)
        lines(dat$DateTime,dat$Sub_metering_1,col="black")
        lines(dat$DateTime,dat$Sub_metering_2,col="red")
        lines(dat$DateTime,dat$Sub_metering_3,col="blue")
       
        legend("topright",col =legendc,legend =legendl,lty=1,
               bg = "transparent", box.col = "black",cex = 0.8 )
        dev.off()
}