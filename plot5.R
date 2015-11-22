setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
library(RColorBrewer)
library(ggplot2)
source("load-data.R")
plotFile = "plot5.png"

X11()

# get data for plot
# filter needed sources
dataScc = SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), 'SCC']
# emissions for each year from vehicle sources in Baltimore City (fips == "24510")
dataNei = aggregate(Emissions ~ year, NEI[NEI$fips == "24510" & NEI$SCC %in% dataScc, ], sum)
dataNei$year = as.factor(dataNei$year)

# draw plot
qplot(
    x = year,
    y = Emissions,
    data = dataNei,
    geom = "bar",
    stat = "identity",
    position = "dodge",
    fill = T,
    main = expression('PM'[2.5]*' dynamic from motor vehicle sources in Baltimore City'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
) + scale_fill_brewer(palette = "Set1") + guides(fill = F)

# save to file
dev.copy(png, filename = plotFile)
dev.off()