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
 
 
# ------------------- Plot 1 ------------------- 
hist(epc_subset$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")  
 
# Save file as plot1.png (480x480)

dev.copy(png, file="plot1.png", width=480, height=480) 
dev.off() 
