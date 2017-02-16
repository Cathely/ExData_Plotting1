unzip("exdata_data_household_power_consumption.zip")
setwd("C:/Users/Yh/ExData_Plotting1")
fpcdata <- read.table('file:///C:/Users/Yh/ExData_Plotting1/household_power_consumption.txt',
                      nrows = 2880,skip = 66637,header = F,sep = ";",
                      na.strings = NA,stringsAsFactors = FALSE,
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3") 
                      )
fpcdata$addTime <- paste(fpcdata$Date,fpcdata$Time,sep=" ")
fpcdata$goodTime <- strptime(fpcdata$addTime,"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)

with(fpcdata,plot(goodTime,Global_active_power,type="n",ylab="Global Active Power(kilowatts)",xlab=""))
with(fpcdata,lines(goodTime,Global_active_power,type="l"))

dev.off()
