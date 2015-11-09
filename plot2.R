setwd("C:/Coursera/Exploratory Data Analysis/Week1/Project1")

##Reading data
householdpowerconsumption <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",na.strings = "?", nrows = 2075260, quote = "", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Getting rid of the first row which contains the names of the columns
householdpowerconsumption<- householdpowerconsumption[-1,]

##Date format
householdpowerconsumption$Date <- as.Date(householdpowerconsumption$Date, format = "%d/%m/%Y")

##Getting data only for the required dates
householdpowerconsumption<- householdpowerconsumption[householdpowerconsumption$Date == "2007-02-01" | householdpowerconsumption$Date == "2007-02-02",]

##Concatanating Date and time
datetime <- paste(as.Date(householdpowerconsumption$Date), householdpowerconsumption$Time)
householdpowerconsumption$Datetime <- as.POSIXct(datetime)

##Constructing plot2
plot(householdpowerconsumption$Global_active_power ~ householdpowerconsumption$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")



