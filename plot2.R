
#########  Exploratory Data Analysis  ###########
#########           Plot 2            ###########



household_power_consumption <- read.table("C:/Users/dimitris/Desktop/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are intrested to make a subset of the large data set in dates  2007-02-01 and 2007-02-02.

k<-household_power_consumption[household_power_consumption$Date=="1/2/2007",]
m<-household_power_consumption[household_power_consumption$Date=="2/2/2007",]

data<-rbind(k,m)
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Global_active_power<-as.numeric(data$Global_active_power)


png("plot2.png", width=480, height=480)
plot(date_time,data$Global_active_power,ylab = "Global Active Power(kilowatts)",type = "l",xlab = "")
dev.off()
