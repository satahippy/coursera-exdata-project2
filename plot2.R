setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
source("load-data.R")
plotFile = "plot2.png"

X11()

# get data for plot
# emissions for each year in Baltimore City, Maryland (fips == "24510")
data = aggregate(Emissions ~ year, NEI[NEI$fips == '24510', ], sum)

# draw plot
barplot(
    height = data$Emissions,
    names.arg = data$year,
    main = expression('PM'[2.5]*' emissions dynamic by years in the Baltimore City, Maryland'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
)

# save to file
dev.copy(png, filename = plotFile)
dev.off()