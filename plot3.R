setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
library(RColorBrewer)
library(ggplot2)
source("load-data.R")
plotFile = "plot3.png"

X11()

# get data for plot
# emissions for each year/type in Baltimore City, Maryland (fips == "24510")
data = aggregate(Emissions ~ year + type, NEI[NEI$fips == '24510', ], sum)
data$year = as.factor(data$year)
data$type = as.factor(data$type)

# draw plot
qplot(
    x = year,
    y = Emissions,
    data = data,
    geom = "bar",
    stat = "identity",
    position = "dodge",
    facets = . ~ type,
    fill = T,
    main = expression('PM'[2.5]*' emissions dynamic by years-types in Baltimore City'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
) + scale_fill_brewer(palette = "Set1") + guides(fill = F)

# save to file
dev.copy(png, filename = plotFile)
dev.off()