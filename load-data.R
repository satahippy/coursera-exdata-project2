if (!dir.exists('data')) {
    dir.create('data')
}

src = "data/data.zip"
if (!file.exists(src)) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", src)
    unzip(src, exdir = 'data')
}

NEI = readRDS("data/summarySCC_PM25.rds")
SCC = readRDS("data/Source_Classification_Code.rds")