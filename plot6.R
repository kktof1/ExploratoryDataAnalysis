## Libraries
library(dplyr)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get SCC numbers which is related with coal combustion
SCC1 <- SCC[grep('vehicle', SCC$EI.Sector, ignore.case = TRUE),]
SCC2 <- SCC1[grep('mobile', SCC1$EI.Sector, ignore.case = TRUE),]
sccNum <- SCC2$SCC

## 6. Comparision between motor vehicle emission at Baltimore City and 
motorVehicle <- NEI[NEI$SCC == sccNum, ]
bmMotorVehicle <- subset(motorVehicle, fips == 24510)
laMotorVehicle <- subset(motorVehicle, fips == 06037)

sprintf("The total emission of motor vehicle at Baltimore is %f while Los Angeles is %f.", 
        sum(bmMotorVehicle$Emissions), sum(laMotorVehicle$Emissions))
