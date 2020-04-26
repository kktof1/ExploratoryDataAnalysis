## Libraries
library(dplyr)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Take Baltimore City
BM <- subset(NEI, fips == 24510)

## 2. Plotting total PM2.5 emission at Baltimore City
bmTotal <- aggregate(BM$Emissions, by = list(BM$year), sum)
names(bmTotal) <- c('year', 'emission')
png(filename = "Plot2.png", width = 320, height = 320)
plot(bmTotal$year, bmTotal$emission, xlab = 'year', ylab = 'emission')
dev.off()

## Conclusion
print("As we can see from the plot, the total emissions of Baltimore City is decreased through the year 1999 ~ 2008. But the emissions are fluctuated from time to time")

# ## Plot with base plotting system
# plot(BM_total, xlab = 'Year', ylab = 'Total emission', type = 'b', axes = F, ylim = c(min(BM_total)-500, max(BM_total)+500))
# axis(1, at = 1:4, labels = names(BM_total))
# axis(2, ylim = c(min(BM_total)-500, max(BM_total)+500))
