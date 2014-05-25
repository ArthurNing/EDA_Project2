NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_total <- aggregate(Emissions ~ year, sum, data = NEI)

png(filename = "plot1.png")
with(NEI_total, plot(year, Emissions, type = "l", xlab = "Year", xaxt = "n", col = "red", lwd = 3))
with(NEI_total, points(year, Emissions, col = "red", pch = 19))
axis(1, at = seq(1999, 2008, by = 3))
title("Total emissions of PM2.5 per year in U.S.")
dev.off()
