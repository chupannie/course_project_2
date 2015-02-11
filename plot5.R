source("script.R")

############# QUESTION 5 ##############
# How have emissions from motor vehicle sources changed from 1999-2008 in
# Baltimore City?
# 1. SCC - "SCC.Level.Two" column has "vehicle"
vehicle_sources <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_scc <- SCC[vehicle_sources,]
# 2. join NEI and SCC on the SCC
vehicle_nei <- NEI[NEI$SCC %in% vehicle_scc$SCC,]
# 3. Filter by balimore (fips==24510)
baltimore_vehicle_nei <- vehicle_nei[vehicle_nei$fips=="24510",]
# 4. make the plot
library(ggplot2)
bv_plot <- ggplot(baltimore_vehicle_nei, aes(factor(year), Emissions)) +
  labs(x="year", y="Total Emission (tons)") +
  labs(title="Emissions for Motor Vehicle Sources in Baltimore City, Maryland") +
  geom_bar(stat="identity",fill="blue") +
  theme_bw() 
print(bv_plot)