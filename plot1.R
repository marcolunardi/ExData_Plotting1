library(datasets)
png(filename="plot1.png",width=480,height=480)

## reads only rows with selected dates from data file
powerdata <- na.omit(read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.string="?"))

## adds header to data subset
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))

## assigns data vector to a variable (to reduce typos risk) and plots the histogram
global <- powerdata[,3]
hist(global, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()