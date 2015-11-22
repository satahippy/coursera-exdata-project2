setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
library(RColorBrewer)
source("load-data.R")
plotFile = "plot2.png"

X11()

# get data for plot
# emissions for each year in Baltimore City, Maryland (fips == "24510")
data = aggregate(Emissions ~ year, NEI[NEI$fips == '24510', ], sum)
data$year = as.factor(data$year)

# some styling
par(bg = "white")
col = brewer.pal(3, "Set1")

# draw plot
barplot(
    height = data$Emissions,
    names.arg = data$year,
    main = expression('PM'[2.5]*' emissions dynamic by years in Baltimore City'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions'),
    col = col[1]
)

# save to file
dev.copy(png, filename = plotFile)
dev.off()