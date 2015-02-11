source("script.R")

############# QUESTION 3 ##############
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question.
library(ggplot2)
# 1. do four individual plots for each "type"
baltimore_plot <- ggplot(emissions_baltimore, aes(factor(year), Emissions, fill=type)) +
  labs(x="year", y="Total Emission (tons)") +
  labs(title="Emissions for Baltimore City by Type") +
  geom_bar(stat="identity") +
  theme_bw() + 
  facet_grid(.~type,scales = "free",space="free")
print(baltimore_plot)