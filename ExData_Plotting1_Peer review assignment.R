##Peer review assignment 1d

##downloaded file ("household_power_consumption.txt") to working directory
library(dplyr)
c1<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
df1<-tbl_df(c1)  ## I like working with tbl_df

##Now look at data
df1  ##looks as expected

##get "We will only be using data from the dates 2007-02-01 and 2007-02-02"
df2<-df1[c1$Date %in% c("1/2/2007","2/2/2007"),] 
df2 ##look at data - looks good

##You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()
dftime<-strptime(paste(df2$Date, df2$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

dfworking<-cbind(dftime,df2) ##create final data for making plots
dfw2<-tbl_df(dfworking)

##Plot 1
Plot1<-hist(dfw2$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
##make it png
png("Plot1.png", width=480, height=480) 
hist(dfw2$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

##Plot 2

Plot2<-plot(dfw2$dftime,dfw2$Global_active_power, type = "l",col="black",xlab = "",ylab = "Global Active Power(kilowatts)")

##make it png
png("Plot2.png", width=480, height=480) 
plot(dfw2$dftime,dfw2$Global_active_power, type = "l",col="black",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()


##Plot 3

plot3<-plot(dfw2$dftime,dfw2$Sub_metering_1, type = "l",col="black",xlab = "",ylab = "Energy sub Metering")
lines(dfw2$dftime,dfw2$Sub_metering_2,col="red")
lines(dfw2$dftime,dfw2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col= c("black", "red", "blue"),lty="solid")

##make it png
png("Plot3.png", width=480, height=480)
plot3<-plot(dfw2$dftime,dfw2$Sub_metering_1, type = "l",col="black",xlab = "",ylab = "Energy sub Metering")
lines(dfw2$dftime,dfw2$Sub_metering_2,col="red")
lines(dfw2$dftime,dfw2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col= c("black", "red", "blue"),lty="solid")
dev.off()


##Plot 4


par(mfrow=c(2,2))

plot(dfw2$dftime, dfw2$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power") 

plot(dfw2$dftime, dfw2$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")

plot(dfw2$dftime,dfw2$Sub_metering_1, type = "l",col="black",xlab = "",ylab = "Energy sub Metering")
lines(dfw2$dftime,dfw2$Sub_metering_2,col="red")
lines(dfw2$dftime,dfw2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col= c("black", "red", "blue"),lty="solid")

plot(dfw2$dftime, dfw2$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")



##Make png

png("Plot4.png", width=480, height=480) 
par(mfrow=c(2,2))

plot(dfw2$dftime, dfw2$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power") 

plot(dfw2$dftime, dfw2$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")

plot(dfw2$dftime,dfw2$Sub_metering_1, type = "l",col="black",xlab = "",ylab = "Energy sub Metering")
lines(dfw2$dftime,dfw2$Sub_metering_2,col="red")
lines(dfw2$dftime,dfw2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col= c("black", "red", "blue"),lty="solid")

plot(dfw2$dftime, dfw2$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
dev.off()





