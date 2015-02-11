source("script.R")

############# QUESTION 1 ##############
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# 1. add all the emissions by year 
emissions_by_year <- aggregate(Emissions ~ year, NEI, sum)
# 2. using BASE plotting system, make a plot showing total PM2.5
# bar chart showing totals for each year
# > head(emissions_by_year)
# year Emissions
# 1 1999   7332967
# 2 2002   5635780
# 3 2005   5454703
# 4 2008   3464206
barplot(emissions_by_year$Emissions, 
        col="blue", 
        main="Total PM2.5 Emission By Year",
        names.arg=emissions_by_year$year,
        xlab="Year",
        ylab="PM2.5 Emissions (tons)")