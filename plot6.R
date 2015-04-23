#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

library(ggplot2)

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#  Which city has seen greater changes over time in motor vehicle emissions?

# Subset data for motor vehicle
vehicle_logical <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
scc_vehicle <- SCC[vehicle_logical,]$SCC
nei_vehicle <- subset(NEI,SCC %in% scc_vehicle)

# Subset data for baltimore, la
vehicle_baltimore_nei <- subset(nei_vehicle,fips == '24510')
vehicle_baltimore_nei$city <- "Baltimore City"
vehicle_LA_nei <- subset(nei_vehicle,fips == '06037') 
vehicle_LA_nei$city <- "Los Angeles County"
nei_baltimore_la <- rbind(vehicle_baltimore_nei,vehicle_LA_nei)

#aggregate the data grouping by year and summing up emissions for each year
nei_baltimore_la_veh_total <- aggregate(Emissions ~ year + city, nei_baltimore_la, sum)

#display summed grouped yearwise data
nei_baltimore_la_veh_total

#Open the PNG file with width and height as 580 each
png(file="plot6.png", width=580, height=580, bg="white")

#draw ggplot
ggplot(data=nei_baltimore_la_veh_total, aes(x=year, y=Emissions, group=city, colour=city)) +
        geom_line(size=2) 

# save the png file to working directory 
dev.off()

print("Answer = Los Angeles has increased Motor Vehicle emission from 1999 to 2008 while Baltimore has decreased Motor Vehicle emission from 1999 to 2008")




