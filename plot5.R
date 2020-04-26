## Libraries
library(dplyr)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get SCC numbers which is related with coal combustion
SCC1 <- SCC[grep('vehicle', SCC$EI.Sector, ignore.case = TRUE),]
SCC2 <- SCC1[grep('mobile', SCC1$EI.Sector, ignore.case = TRUE),]
sccNum <- SCC2$SCC

## 5. Plotting motor vehicle emission at Baltimore City
motorVehicle <- NEI[NEI$SCC == sccNum, ]
bmMotorVehicle <- subset(motorVehicle, fips == 24510)
bmmvTotal <- aggregate(bmMotorVehicle$Emissions, by = list(bmMotorVehicle$year), sum)
names(bmmvTotal) <- c('year', 'emission')
png(filename = "Plot5.png", width = 320, height = 320)
plot(bmmvTotal$year, bmmvTotal$emission, xlab = 'year', ylab = 'emission')
dev.off()
