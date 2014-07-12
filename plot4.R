library(datasets)
png(filename="plot4.png",width=480,height=480)

## reads only rows with selected dates from data file
powerdata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";")

## adds header to data subset
colnames(powerdata) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))

## creates the vector of combined dates and times and adds it to the dataframe as a new column
datetime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$datetime <- datetime

## assigns some y data vectors to variables (to reduce typos risk) and plots the four graphs
par(mfrow=c(2,2))
global <- powerdata[,3]
reactive <- powerdata[,4]
sub1 <- powerdata[,7]
sub2 <- powerdata[,8]
sub3 <- powerdata[,9]
plot(powerdata$datetime, global, type="l", col="black", xlab="", ylab="Global Active Power")
plot(powerdata$datetime, powerdata$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(powerdata$datetime, sub1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(powerdata$datetime, sub2, type="l", col="red")
lines(powerdata$datetime, sub3, type="l", col="blue")
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(powerdata$datetime, reactive, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()