install.packages("gridExtra")
library(ggplot2)
library(grid)
library(gridExtra)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dat_motor <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD",]
motor_sum <- aggregate(Emissions ~ year + fips, sum, data = dat_motor)

png(filename = "plot6.png", width = 800, height = 400)
p1 <-
  ggplot(motor_sum[motor_sum$fips == "24510",], aes(year, Emissions)) +
  geom_point(color = "deepskyblue", size = 3, alpha = 4/5) + 
  geom_line(color = "deepskyblue", linetype="dashed", lwd = 1) + 
  scale_x_continuous(breaks = seq(1999, 2008, 3)) +
  labs(x = "Year")

p2 <-  
  ggplot(motor_sum[motor_sum$fips == "06037",], aes(year, Emissions)) +
  geom_point(color = "mediumorchid", size = 3, alpha = 4/5) + 
  geom_line(color = "mediumorchid", linetype="dashed", lwd = 1) + 
  scale_x_continuous(breaks = seq(1999, 2008, 3)) +
  labs(x = "Year")

grid.arrange(p1, p2, ncol = 2, main = "Emissions of PM2.5 per year from motor vehicle sources in Baltimore City(left) and  Los Angeles County(right)")

dev.off()
  
