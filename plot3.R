library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dat_BC <- NEI[NEI$fips == "24510",]

BC_total <- aggregate(Emissions ~ year + type, sum, data = dat_BC)

png(filename = "plot3.png", width = 600, height = 600)
g <- ggplot(BC_total, aes(year, Emissions))
p <- g + geom_point(color = "red", size = 3, alpha = 4/5) + facet_wrap(~type, ncol = 2) +
  geom_line(color = "red", lwd = 1) + scale_x_continuous(breaks = seq(1999, 2008, 3)) +
  labs(title = "Emissions of PM2.5 per year from four types of sources in Baltimore City", 
       x = "Year") + theme(plot.title = element_text(lineheight=.8, face="bold"))
p
dev.off()
