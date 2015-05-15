if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

## Unzip the file folder downloaded into the "data" folder. 
unzip(zipfile="./data/Dataset.zip",exdir="./data")

dataPath <- "./data/household_power_consumption.txt"
Data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSetData)

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


