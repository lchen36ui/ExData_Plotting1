# Retrieve whole Electric power consumption (EPC) dataset after downloading and saving it to working directory

epc_fulldata <- read.csv("./household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F, na.strings="?",  
                       nrows=2075259, comment.char="", quote='\"') 

epc_fulldata$Date <- as.Date(epc_fulldata$Date, format="%d/%m/%Y") 
 

# initial procedures to subset and convert date as requied
 
epc_subset <- subset(epc_fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(epc_fulldata) 
 
 
# Converting dates
 datetime <- paste(as.Date(epc_subset$Date), epc_subset$Time) 
 epc_subset$Datetime <- as.POSIXct(datetime) 
 
 
# ------------------- Plot 4 ------------------- 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(epc_subset, { 
    plot(Global_active_power~Datetime, type="l",  
      xlab="",ylab="Global Active Power") 
    plot(Voltage~Datetime, type="l",  
    xlab="datetime", ylab="Voltage") 
   plot(Sub_metering_1~Datetime, type="l",  
        xlab="", ylab="Energy sub metering") 
    lines(Sub_metering_2~Datetime,col='Red') 
    lines(Sub_metering_3~Datetime,col='Blue') 
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
    plot(Global_reactive_power~Datetime, type="l",  
         xlab="datetime", ylab="Global_rective_power") 
 })  
 
# Save file as plot4.png (480x480)

dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off()   
