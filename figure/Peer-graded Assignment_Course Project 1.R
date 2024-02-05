#
#Dataset: Electric power consumption
#
#Dataset-Variables:
#           1. Date (dd/mm/yyyy)
#           2. Time (hh:mm:ss)
#           3. Global_active_power (kW)
#           4. Global_reactive_power (kW)
#           5. Voltage (V)
#           6. Global_intensity (A)
#           7. Sub_metering_1 (kW/h of 3, kitchen)
#           8. Sub_metering_2 (kW/h of 3, laundry)
#           9. Sub_metering_3 (kW/h of 3, electric water-heater / air-conditioner)
#           
#Grading Criteria:
#           1. GitHub URL
#           2. at least one commit beyond original fork
#           3. graph files correct file format
#           4. plot correct?
#           5. R code creates the referred plot?
#
#______________________________________________________________________________#

library(dplyr) #for pipeline function (%>%)
data<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
               na.strings = "?") 

subdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))%>%
      mutate(Date=as.Date(Date,format= "%d/%m/%Y")) %>%
      strptime(subdata$Time, format= "%H:%M:%S", tz="")
#create subset for date range
lapply(data, class) #check conversion success

###PLOT 1###
png(filename = "plot1.png", width = 480, height = 480) #open png
hist(data$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")
dev.off() #close png graphic device

###PLOT2###
png(filename = "plot2.png", width = 480, height = 480) #open png
xaxis=data$Time
plot(xaxis[,2],data$Global_active_power, type="l", xlab="", 
     ylab = "Global Active Power (kilowatts)")
