
# Create plot folder if doesnt exist
if (!file.exists('plots')) {
  dir.create('plots')
}

# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(clean_consumption$DateTime,clean_consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()