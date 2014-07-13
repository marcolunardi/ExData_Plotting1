library(datasets)
png(filename="plot2.png",width=480,height=480)

## reads only rows with selected dates from data file
powerdata <- na.omit(read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.string="?"))

## adds header to data subset
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))

## creates the vector of combined dates and times and adds it to the dataframe as a new column
datetime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$datetime <- datetime

## assigns the y data vector to a variable (to reduce typos risk) and plots the graph
global <- powerdata[,3]
plot(powerdata$datetime, global, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()