# Create plot folder
if (!file.exists('plots')) {
  dir.create('plots')
}

# Open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# Plot the data
hist(clean_consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()