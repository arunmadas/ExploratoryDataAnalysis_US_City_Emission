#####################################################################################################################
# Author : Arun Kumar Madas
# Date   : 04/22/2015
# Course : Exploratory Data Analysis - Project 2
#####################################################################################################################

## Read the rds serialized objects
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Subset coal combustion related NEI data
combustion_logicals <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_logicals <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustion_coal_logicals <- (combustion_logicals & coal_logicals)
scc_codes_coalcCombustion <- SCC[combustion_coal_logicals,]$SCC
nei_coal_combustion_subset <- NEI[NEI$SCC %in% scc_codes_coalcCombustion,]

#aggregate the data grouping by year and summing up emissions for each year
nei_coal_combustion_subset_total <- aggregate(Emissions ~ year, nei_coal_combustion_subset, sum)

#display summed grouped yearwise data
nei_coal_combustion_subset_total

#Open the PNG file with width and height as 480 each
png(file="plot4.png", width=480, height=480, bg="white")

#draw a line chart using base plotting system and see how line goes down
plot(nei_coal_combustion_subset_total$year, nei_coal_combustion_subset_total$Emissions/10^4,type="l",xlab="year",ylab="Total Emission (Units*10^4)", main="Total Coal Combustion Emissions per year",xaxt="n",lwd="5")
axis(1, at=unique(NEI_yearwise_total$year))

# save the png file to working directory 
dev.off()

print("Answer = Total Coal Combustion has seen total emissions for each year decrease from 1999 to 2008")




