
library("foreign")
library("lubridate")

# read the raw table
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=variable.class)

# Limit data to 2 dates
consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
head(consumption)

# Clean up the variable names and convert date/time fields
column_names<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(consumption)<-column_names
consumption$DateTime<-dmy(consumption$Date)+hms(consumption$Time)
consumption<-consumption[,c(10,3:9)]

# Write a clean data set to the directory
write.table(consumption,file='power_consumption.txt',sep='|',row.names=FALSE)

# Read in newly created clean data
clean_consumption<-read.table('power_consumption.txt',header=TRUE,sep='|')
clean_consumption$DateTime<-as.POSIXlt(clean_consumption$DateTime)