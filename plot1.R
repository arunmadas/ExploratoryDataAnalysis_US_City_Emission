#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Aggregate the total emissions grouping by the year
NEI_yearwise_total <- aggregate(Emissions ~ year, NEI, sum)

#output the aggregated sum data
NEI_yearwise_total

#Open the PNG file with width and height as 480 each
png(file="plot1.png", width=480, height=480, bg="white")

#draw a line chart using base plotting system and see how line goes down
plot(NEI_yearwise_total$year, NEI_yearwise_total$Emissions/10^4,type="l",xlab="year",ylab="Total Emission (Units*10^4)", main="Total Emissions per year",xaxt="n",lwd="5")
axis(1, at=unique(NEI_yearwise_total$year))

# save the png file to working directory 
dev.off()

print("Answer = YES, line goes down lower by the end of 2008 from where it started in 1999")




