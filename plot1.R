setwd("/home/sata/tmp/3/r test/coursera/exdata/project3");
library(stats)
source("load-data.R")
plotFile = "plot1.png"

X11()

# get data for plot
# emissions for each year
data = aggregate(Emissions ~ year, NEI, sum)

# draw plot
barplot(
    height = data$Emissions,
    names.arg = data$year,
    main = expression('PM'[2.5]*' emissions dynamic by years'),
    xlab = "Year",
    ylab = expression('PM'[2.5]*' emissions')
)

# save to file
dev.copy(png, filename = plotFile)
dev.off()