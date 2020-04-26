## Libraries
library(dplyr)
library(ggplot2)
library(gridExtra)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Take Baltimore City
BM <- subset(NEI, fips == 24510)

## 3. Plotting emission by 4 types at Baltimore City
bmTotal2 <- aggregate(BM$Emissions, by = list(BM$type, BM$year), sum)
names(bmTotal2) <- c('type', 'year', 'emission')
png(filename = "Plot3.png", width = 480, height = 480)
dataPoint  <- bmTotal2[which(bmTotal2$type == "POINT"),]
dataNonPt  <- bmTotal2[which(bmTotal2$type == "NONPOINT"),]
dataOnRoad <- bmTotal2[which(bmTotal2$type == "ON-ROAD"),]
dataNonRd  <- bmTotal2[which(bmTotal2$type == "NON-ROAD"),]
quad1 <- ggplot(dataPoint)  + geom_point(aes(year, emission)) + ggtitle("Point")
quad2 <- ggplot(dataNonPt)  + geom_point(aes(year, emission)) + ggtitle("Non Point")
quad3 <- ggplot(dataOnRoad) + geom_point(aes(year, emission)) + ggtitle("On Road")
quad4 <- ggplot(dataNonRd)  + geom_point(aes(year, emission)) + ggtitle("Non Road")
grid.arrange(quad1, quad2, quad3, quad4, nrow = 2, ncol = 2)
dev.off()

## Conclusion
print("As we can see from the plot, [Point] is increased while [Non Point], [On Road], [Non Road] are descreased in terms of total emission through the year 1999 ~ 2008")
