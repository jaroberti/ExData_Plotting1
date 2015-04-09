#This script takes data from the Individual household electric power consumption Data Set and plots a histogram of Global Active Power
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
#convert 'global_active_power' data to numeric values:
electricFEB$Global_active_power<-as.numeric(electricFEB$Global_active_power)
#histogram of global active power:
png(file="C:\\Users\\jroberti\\JohnsHopkinsDataScience\\exploratoryDataAnalysis\\plot1.png",width=480,height=480,units="px")
#make plot
hist(electricFEB$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#close graphic device:
dev.off()
#---------------------------END: PLOT DATA TO PNG-------------------------------------#