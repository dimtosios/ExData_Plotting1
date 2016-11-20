
#########  Exploratory Data Analysis  ###########
#########           Plot 4            ###########



household_power_consumption <- read.table("C:/Users/dimitris/Desktop/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are intrested to make a subset of the large data set in dates  2007-02-01 and 2007-02-02.

k<-household_power_consumption[household_power_consumption$Date=="1/2/2007",]
m<-household_power_consumption[household_power_consumption$Date=="2/2/2007",]

data<-rbind(k,m)
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)



png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot 1
plot(date_time,data$Global_active_power,ylab = "Global Active Power(kilowatts)",type = "l",xlab = "")

#plot 2
plot(date_time,data$Voltage,ylab = "voltage",xlab = "datetime",type ="l")


#Plot 3
plot(date_time,data$Sub_metering_1,ylab = "",xlab = "",type = "l",ylim = c(0,40))
par(new=T)
plot(date_time,data$Sub_metering_2,ylab = "",xlab = "",type = "l",col=2,ylim = c(0,40))
par(new=T)
plot(date_time,data$Sub_metering_3,ylab = "Energy sub metering",xlab = "",type = "l",col=4,ylim = c(0,40))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty = "n")

#plot 4
plot(date_time,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
