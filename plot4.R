## First read the dataframe and define the first 2 columns to be of type "character"
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create a new column called "datetime" which merges date and time variables and converts them to POSIXct.
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Convert Date to "Date" class so that we can filter the dates of interest
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset the dates of interest only
feb <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

## Use the png device
png("plot4.png",width=480, height=480,units="px")

## Define margins for plot, and draw plots across rows
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 

##Printing plot 2 first, starting from the top left corner
plot(feb$datetime,feb$Global_active_power,type="l",ylab="Global Active Power",xlab ="")

##Printing Voltage/datetime on the top-right
plot(feb$datetime,feb$Voltage,type="l",ylab="Voltage",xlab ="datetime")

##Printing plot 3 without border box for the legend
plot(feb$datetime,feb$Sub_metering_1,type="n",ylab="Energy sub metering",xlab ="")
lines(feb$datetime,feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab ="", col="black")
lines(feb$datetime,feb$Sub_metering_2,type="l",ylab="Energy sub metering",xlab ="", col="red")
lines(feb$datetime,feb$Sub_metering_3,type="l",ylab="Energy sub metering",xlab ="", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =c(1,1),col=c("black","red","blue"),bty="n")

##Printing Global_reactive_power/datetime
plot(feb$datetime,feb$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab ="datetime")

## Close the device
dev.off()