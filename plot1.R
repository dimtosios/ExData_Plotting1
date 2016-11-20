
#########  Exploratory Data Analysis  ###########
#########           Plot 1            ###########




household_power_consumption <- read.table("C:/Users/dimitris/Desktop/Coursera/Exploratory Data Analysis/Project 1/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are intrested to make a subset of the large data set in dates  2007-02-01 and 2007-02-02.

k<-household_power_consumption[household_power_consumption$Date=="1/2/2007",]
m<-household_power_consumption[household_power_consumption$Date=="2/2/2007",]

data<-rbind(k,m)
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Global_active_power<-as.numeric(data$Global_active_power)


png("plot1.png", width=480, height=480)
hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = 2)
dev.off()



subSetData <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



