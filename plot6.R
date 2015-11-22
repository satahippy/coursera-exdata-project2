setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
library(ggplot2)
source("load-data.R")
plotFile = "plot6.png"

X11()

# get data for plot
# filter needed sources
dataScc = SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = T), 'SCC']
# emissions for each year from vehicle sources in
# Baltimore City (fips == "24510") and Los Angeles County (fips == "06037")
dataNei = aggregate(
    Emissions ~ year + fips,
    NEI[NEI$fips %in% c("24510", "06037") & NEI$SCC %in% dataScc, ],
    sum
)
dataNei$year = as.factor(dataNei$year)
# fips as name
dataNei$Place = factor(
    dataNei$fips,
    levels = c("24510", "06037"),
    labels = c("Baltimore City", "Los Angeles County")
)

# draw plot
qplot(
    x = year,
    y = Emissions,
    data = dataNei,
    geom = "bar",
    stat = "identity",
    position = "dodge",
    fill = Place,
    main = expression('PM'[2.5]*' dynamic from motor vehicle sources'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
)

# save to file
dev.copy(png, filename = plotFile)
dev.off()