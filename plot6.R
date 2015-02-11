source("script.R")

############# QUESTION 6 ##############
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?
# 1. Do the same as question 5 for Los Angeles (fips = 06037)
# 1. SCC - "SCC.Level.Two" column has "vehicle"
vehicle_sources <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_scc <- SCC[vehicle_sources,]
# 2. join NEI and SCC on the SCC
vehicle_nei <- NEI[NEI$SCC %in% vehicle_scc$SCC,]
# 3. Filter by balimore (fips==24510)
LA_vehicle_nei <- vehicle_nei[vehicle_nei$fips=="06037",]
# 4. make the plot by comparing baltimore and los angeles side by side
LA_vehicle_nei$name <- "Los Angeles County, California"
baltimore_vehicle_nei$name <- "Baltimore City, Maryland"
combined_nei <- rbind(LA_vehicle_nei,baltimore_vehicle_nei)
library(ggplot2)
double_plot <- ggplot(combined_nei, aes(factor(year), Emissions, fill=name)) +
  labs(x="year", y="Total Emission (tons)") +
  labs(title="Emissions for Motor Vehicle Sources in Baltimore City and Los Angeles County") +
  geom_bar(aes(fill=year),stat="identity") +
  theme_bw() +
  facet_grid(scales="free", space="free", .~name) 
print(double_plot)
