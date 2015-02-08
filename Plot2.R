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
  
 
# ------------------- Plot 2 ------------------- 
plot(epc_subset$Global_active_power~epc_subset$Datetime, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)") 

# Save file as plot2.png (480x480)

dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
