source("script.R")

############# QUESTION 4 ##############
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?
# 1. SCC - "SCC.Level.One" column has "comb" for combustion
combustion_scc <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
# 2. SCC - "SCC.Level.Four" column has "coal"
coal_scc <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coal_combustion_scc_index <- (combustion_scc & coal_scc)
coal_combustion_scc <- SCC[coal_combustion_scc_index,]
# 3. Join SCC fields
coal_combustion_nei <- NEI[NEI$SCC %in% coal_combustion_scc$SCC,]
# 4. make the plot
library(ggplot2)
cc_plot <- ggplot(coal_combustion_nei, aes(factor(year), Emissions)) +
  labs(x="year", y="Total Emission (tons)") +
  labs(title="Emissions for Coal Combustion-Related Sources") +
  geom_bar(stat="identity",fill="blue") +
  theme_bw() 
print(cc_plot)
