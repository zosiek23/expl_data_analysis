consumption<- read.txt("household_power_consumption.txt", colClasses = c("date", "time", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric"))
head(consumption)

consumption = read.table("household_power_consumption.txt")

d = read.table("household_power_consumption.txt", 
               sep=";", 
               col.names=c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               fill=FALSE, 
               strip.white=TRUE)


column_names<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(consumption)<-column_names
consumption$DateTime<-dmy(consumption$Date)+hms(consumption$Time)
#consumption$DateTime<-as.POSIXct(paste(consumption$Date, consumption$Time), format="%Y-%m-%d %H:%M:%S")
consumption<-consumption[,c(10,3:9)]

# load data
source('Assignement1_script.R')

