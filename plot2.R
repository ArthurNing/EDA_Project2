NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dat_BC <- NEI[NEI$fips == "24510",]

BC_total <- aggregate(Emissions ~ year, sum, data = dat_BC)

png(filename = "plot2.png")
with(BC_total, plot(year, Emissions, type = "l", xlab = "Year", xaxt = "n", col = "red", lwd = 3))
with(BC_total, points(year, Emissions, col = "red", pch = 19))
axis(1, at = seq(1999, 2008, by = 3))
title("Total emissions of PM2.5 per year in Baltimore City")
dev.off()