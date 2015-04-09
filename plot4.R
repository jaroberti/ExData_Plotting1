#This script takes data from the Individual household electric power consumption Data Set and creates 4 plots. 
#Plot 1 = time series of Global Active Power
#Plot 2 = time series of voltage
#Plot 3 = time series of Energy Sub Metering
#plot 4 = time series of Global Reactive Power
#-----------------------START: OPEN AND CLEAN DATA------------------------------------#
#read the dataset into variable called 'electric' (NA values in dataset are given as "?")
electric<-read.table("C:/Users/jroberti/JohnsHopkinsDataScience/exploratoryDataAnalysis/household_power_consumption.txt", header=TRUE, sep=";", colClasses="character", na.strings = "?")

#paste $Date and $Time together:
electric$timeStamp<-paste(electric$Date,electric$Time,sep=" ")

#suset the dataset to only include data from 2007-02-01 through 2007-02-02:
electricFEB<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")

#coerce the $timeStamp from "character" to "Date" within the subset of data:
electricFEB$timeStamp1<-strptime(electricFEB$timeStamp,format="%d/%m/%Y %H:%M:%S")
#-------------------------END: OPEN AND CLEAN DATA------------------------------------#

#-------------------------START: PLOT DATA TO PNG-------------------------------------#
png(file="C:\\Users\\jroberti\\JohnsHopkinsDataScience\\exploratoryDataAnalysis\\plot4.png",width=480,height=480,units="px")
#make plot
#put 4 plots on the same page:
par(mfrow=c(2,2)) # 2 row x 2 col
#reset the margin parameters:
par(mar=c(4,4,2,2))

#1st plot:
plot(electricFEB$timeStamp1,electricFEB$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#2nd plot:
plot(electricFEB$timeStamp1,electricFEB$Voltage,type="l",xlab="datetime",ylab="Voltage")

#3rd plot:
plot(electricFEB$timeStamp1,electricFEB$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#plot energy sub metering 2
lines(electricFEB$timeStamp1,electricFEB$Sub_metering_2,col="red")
#plot energy sub metering 3
lines(electricFEB$timeStamp1,electricFEB$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty = "n")

#4th plot:
plot(electricFEB$timeStamp1,electricFEB$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#close graphic device:
dev.off()
#---------------------------END: PLOT DATA TO PNG-------------------------------------#