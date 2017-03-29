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

hist(dfw2$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

