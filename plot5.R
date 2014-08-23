
# below two lines makes the script independent of the path 
# where it is downlaoded and executed from
script_path <- dirname(sys.frame(1)$ofile)
setwd(script_path)


# read the data into "filtered_data" variable to be
# used later for plotting
source("data-in.R")


filteredData <- pm25Data[pm25Data$fips == "24510", ] 


png(filename = "plot5.png",  
    width = 480, height = 480,  
    units = "px") 

motorData <- grep("motor", sccData$Short.Name, ignore.case = T) 
motorData <- sccData[motorData, ] 
motorData <- filteredData[filteredData$SCC %in% motorData$SCC, ] 
motorEmissions <- aggregate(motorData$Emissions, list(motorData$year), FUN = "sum") 

 
plot(motorEmissions, type = "l", xlab = "Year",  
    main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City",  
    ylab = expression('Total PM'[2.5]*" Emission")) 


dev.off() 

