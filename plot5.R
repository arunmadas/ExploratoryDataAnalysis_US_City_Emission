#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Subset data for motor vehicle
vehicle_logical <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
scc_vehicle <- SCC[vehicle_logical,]$SCC
nei_vehicle <- subset(NEI,SCC %in% scc_vehicle)

# create subset for baltimore fips
nei_baltimore_motor_veh <- subset(nei_vehicle, fips=='24510')

#aggregate the data grouping by year and summing up emissions for each year
nei_baltimore_motor_veh_total <- aggregate(Emissions ~ year, nei_baltimore_motor_veh, sum)

#display summed grouped yearwise data
nei_baltimore_motor_veh_total

#Open the PNG file with width and height as 480 each
png(file="plot5.png", width=480, height=480, bg="white")

#draw a line chart using base plotting system and see how line goes down
plot(nei_baltimore_motor_veh_total$year, nei_baltimore_motor_veh_total$Emissions,type="l",xlab="year",ylab="Total Emission", main="Total Motor Vehicle Emissions for Baltimore per year",xaxt="n",lwd="5")
axis(1, at=unique(nei_baltimore_motor_veh_total$year))

# save the png file to working directory 
dev.off()

print("Answer = Total Motor Vehicle emissions for baltimore city has seen each year decrease from 1999 to 2008, sharp decline from 1999 to 2002 at first")




