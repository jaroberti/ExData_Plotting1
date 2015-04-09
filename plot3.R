#This script takes data from the Individual household electric power consumption Data Set and plots a time series of Energy Sub Metering
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
#plot of Energy sub metering 1 through 3:
#plot energy sub metering 1, assing x (blank) and y labels
png(file="C:\\Users\\jroberti\\JohnsHopkinsDataScience\\exploratoryDataAnalysis\\plot3.png",width=480,height=480,units="px")
#make plot
plot(electricFEB$timeStamp1,electricFEB$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
#plot energy sub metering 2
lines(electricFEB$timeStamp1,electricFEB$Sub_metering_2,col="red")
#plot energy sub metering 3
lines(electricFEB$timeStamp1,electricFEB$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
#close graphic device:
dev.off()
#---------------------------END: PLOT DATA TO PNG-------------------------------------#