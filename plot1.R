## First read the dataframe and define the first 2 columns to be of type "character"
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Convert Date to "Date" class so that we can filter the dates of interest
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset the dates of interest only
feb <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

## Use the png device
png("plot1.png",width=480, height=480,units="px")

## Define margins for plot
par(mar= c(4, 4, 2, 1))

## Plot the histogram
hist(feb$Global_active_power, col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")

## Close the device
dev.off()