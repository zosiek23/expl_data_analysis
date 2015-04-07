# Create plot folder if doesnt exist
if (!file.exists('plots')) {
  dir.create('plots')
}

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')

# Allow to make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(clean_consumption$DateTime,clean_consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(clean_consumption$DateTime,clean_consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(clean_consumption$DateTime,clean_consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(clean_consumption$DateTime,clean_consumption$SubMetering2,col=lncol[2])
lines(clean_consumption$DateTime,clean_consumption$SubMetering3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')


# plot data on bottom right (2,2)
plot(clean_consumption$DateTime,clean_consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
x<-dev.off()