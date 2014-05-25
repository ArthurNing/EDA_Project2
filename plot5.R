library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dat_BC_motor <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
BC_motor_sum <- aggregate(Emissions ~ year, sum, data = dat_BC_motor)

png(filename = "plot5.png", width = 600, height = 600)
g <- ggplot(BC_motor_sum, aes(year, Emissions))
p <- g + geom_point(color = "deepskyblue", size = 3, alpha = 4/5) + 
  geom_line(color = "deepskyblue", linetype="dashed", lwd = 1) + 
  scale_x_continuous(breaks = seq(1999, 2008, 3)) +
  labs(title = "Emissions of PM2.5 per year from motor vehicle sources in Baltimore City", 
       x = "Year") + theme(plot.title = element_text(lineheight=.8, face="bold"))
p
dev.off()