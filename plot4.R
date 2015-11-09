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

##Constructing plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(householdpowerconsumption, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, 
         lwd = 2, 
         bty = "n",cex = 0.7,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})







