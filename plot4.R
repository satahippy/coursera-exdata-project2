setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
library(ggplot2)
source("load-data.R")
plotFile = "plot4.png"

X11()

# get data for plot
# filter needed sources
dataScc = SCC[grepl("coal", SCC$EI.Sector, ignore.case = T), 'SCC']
# emissions for each year from coal combustion sources
dataNei = aggregate(Emissions ~ year, NEI[NEI$SCC %in% dataScc, ], sum)
dataNei$year = as.factor(dataNei$year)

# draw plot
qplot(
    x = year,
    y = Emissions,
    data = dataNei,
    geom = "bar",
    stat = "identity",
    position = "dodge",
    main = expression('PM'[2.5]*' emissions dynamic by years from coal combustion sources'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
)

# save to file
dev.copy(png, filename = plotFile)
dev.off()