## First read the dataframe and define the first 2 columns to be of type "character"
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## Create a new column called "datetime" which merges date and time variables and converts them to POSIXct.
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

## Convert Date to "Date" class so that we can filter the dates of interest
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Subset the dates of interest only
feb <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

## Use the png device
png("plot2.png",width=480, height=480,units="px")

## Define margins for plot
par(mar= c(4, 4, 2, 1))

## Print a lines plot for Global active power/datetime (continuous)
plot(feb$datetime,feb$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab ="")

## Close the .png device
dev.off()