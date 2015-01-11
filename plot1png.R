

plot1 <- function(){
data <- read.table("./exp/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

data$Date <- as.Date(data$Date,format ="%d/%m/%Y")
dat <- subset(data,(data$Date=="2007-02-02")| (data$Date=="2007-02-01"))


png(file ="plot1.png")
hist(dat$Global_active_power,col="red",xlab="Global Active Power(kilowatts)", main ="Global Active Power")
dev.off()

}