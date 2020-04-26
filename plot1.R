## Libraries
library(dplyr)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 1. Plotting total PM2.5 emission through years
srcTotal <- aggregate(NEI$Emissions, by = list(NEI$year), sum)
names(srcTotal) <- c('year', 'emission')
png(filename = "Plot1.png", width = 320, height = 320)
plot(srcTotal$year, srcTotal$emission, xlab = 'year', ylab = 'emission')
dev.off()

## Conclusion
print("As we can see from the plot, the total emissions of United States is decreased through the year 1999 ~ 2008")
