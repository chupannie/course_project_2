source("script.R")

############# QUESTION 2 ##############
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.
# 1. filter by fips for 24510
emissions_baltimore <- NEI[NEI$fips=="24510",]
emissions_baltimore_by_year <- aggregate(Emissions ~ year, emissions_baltimore, sum)
barplot(emissions_baltimore_by_year$Emissions, 
        col="blue", 
        main="Total PM2.5 Emission By Year in Baltimore City, Maryland",
        names.arg=emissions_baltimore_by_year$year,
        xlab="Year",
        ylab="PM2.5 Emissions (tons)")