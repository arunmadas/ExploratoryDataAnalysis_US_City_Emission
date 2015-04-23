#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#  Use the base plotting system to make a plot answering this question.

#subset the data set for baltimore fips
NEI_baltimore = subset(NEI, fips=='24510')

#aggregate the data grouping by year and summing up emissions for each year
NEI_Baltimore_yr_total <- aggregate(Emissions ~ year, NEI_baltimore, sum)

#display summed grouped yearwise data for baltimore
NEI_Baltimore_yr_total

#Open the PNG file with width and height as 480 each
png(file="plot2.png", width=480, height=480, bg="white")

#draw a line chart using base plotting system and see how line goes down
plot(NEI_Baltimore_yr_total$year, NEI_Baltimore_yr_total$Emissions,type="l",xlab="year",ylab="Total Emission", main="Total Baltimore Emissions per year",xaxt="n",lwd="5")
axis(1, at=unique(NEI_Baltimore_yr_total$year))

# save the png file to working directory 
dev.off()

print("Answer = YES, line goes down lower by the end of 2008 from where it started in 1999")




