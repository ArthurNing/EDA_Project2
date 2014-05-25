NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_coal_comb <- SCC[grepl("comb", SCC$EI.Sector, ignore.case=TRUE) &
  grepl("coal", SCC$EI.Sector, ignore.case=TRUE),]

NEI_coal_comb <- subset(NEI, SCC %in% SCC_coal_comb$SCC)

coalComb_total <- aggregate(Emissions ~ year, sum, data = NEI_coal_comb)

png(filename = "plot4.png", width = 600, height = 600)
with(coalComb_total, plot(year, Emissions, type = "l", xlab = "Year", xaxt = "n", col = "red", lwd = 1, lty=2))
with(coalComb_total, points(year, Emissions, col = "red", pch = 19))
axis(1, at = seq(1999, 2008, by = 3))
title("Emissions from coal combustion-related sources per year in U.S.")
dev.off()
