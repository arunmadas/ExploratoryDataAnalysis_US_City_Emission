#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

#use the ggplot2 library
library(ggplot2)

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

#subset the data set for baltimore fips
NEI_baltimore = subset(NEI, fips=='24510')

#aggregate the data grouping by year and summing up emissions for each year
NEI_Baltimore_type_total <- aggregate(Emissions ~ year + type, NEI_baltimore, sum)

#display summed grouped yearwise data for baltimore
NEI_Baltimore_type_total

#Open the PNG file with width and height as 480 each
png(file="plot3.png", width=580, height=580, bg="white")

ggplot(data=NEI_Baltimore_type_total, aes(x=year, y=Emissions, group=type, colour=type)) +
        geom_line(size=2) 

# save the png file to working directory 
dev.off()

print("Answer = POINT has seen slight increase from 1999 to 2008, rest all NON-ROAD,NONPOINT,ON-ROAD have seen decrease from 1999 to 2008")




