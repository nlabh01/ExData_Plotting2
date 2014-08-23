
# below two lines makes the script independent of the path 
# where it is downlaoded and executed from
script_path <- dirname(sys.frame(1)$ofile)
setwd(script_path)


# read the data into "filtered_data" variable to be
# used later for plotting
source("data-in.R")


png(filename = "plot4.png",  
width = 480, height = 480,  
units = "px") 
coal <- grep("coal", sccData$Short.Name, ignore.case = T) 
coal <- sccData[coal, ] 
coal <- pm25Data[pm25Data$SCC %in% coal$SCC, ] 

 
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum") 

plot(coalEmissions, type = "l", xlab = "Year",  
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008",  
     ylab = expression('Total PM'[2.5]*" Emission")) 

  
dev.off() 

