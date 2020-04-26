## Libraries
library(dplyr)

## Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get SCC numbers which is related with coal combustion
SCC1 <- SCC[grep('coal', SCC$EI.Sector, ignore.case = TRUE),]
SCC2 <- SCC1[grep('comb', SCC1$EI.Sector, ignore.case = TRUE),]
sccNum <- SCC2$SCC

## 4. Plotting coal combustion-related emissions
coalComb <- NEI[NEI$SCC == sccNum, ]
ccTotal <- aggregate(coalComb$Emissions, by = list(coalComb$year), sum)
names(ccTotal) <- c('year', 'emission')
png(filename = "Plot4.png", width = 320, height = 320)
plot(ccTotal$year, ccTotal$emission, xlab = 'year', ylab = 'emission')
dev.off()

## Conclusion
print("As we can see from the plot, the coal combustion-related emissions is decreased through the year 1999 ~ 2008. But it has been up and down.")
