## First read the dataframe and define the first 2 columns to be of type "character"
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create a new column called "datetime" which merges date and time variables and converts them to POSIXct.
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Convert Date to "Date" class so that we can filter the dates of interest
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset the dates of interest only
feb <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

## Use the png device
png("plot3.png",width=480, height=480,units="px")

## Define margins for plot
par(mar= c(4, 4, 2, 1))

## Print a blank canvas, then draw the 3 lines per Sub metering
plot(feb$datetime,feb$Sub_metering_1,type="n",ylab="Energy sub metering",xlab ="")
lines(feb$datetime,feb$Sub_metering_1,type="l",ylab="Energy sub metering",xlab ="", col="black")
lines(feb$datetime,feb$Sub_metering_2,type="l",ylab="Energy sub metering",xlab ="", col="red")
lines(feb$datetime,feb$Sub_metering_3,type="l",ylab="Energy sub metering",xlab ="", col="blue")
## Enter the top-right legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty =c(1,1),col=c("black","red","blue"))

## Close the .png device
dev.off()