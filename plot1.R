# below two lines makes the script independent of the path 
# where it is downlaoded and executed from
script_path <- dirname(sys.frame(1)$ofile)
setwd(script_path)


# read the data into "filtered_data" variable to be
# used later for plotting
source("data-in.R")

 
png(filename = "plot1.png",  
    width = 480, height = 480,  
    units = "px") 

totalEmissions <- aggregate(pm25Data$Emissions, list(pm25Data$year), FUN = "sum") 

plot(totalEmissions, type = "l", xlab = "Year",  
     main = "Total Emissions in the United States from 1999 to 2008",  
     ylab = expression('Total PM'[2.5]*" Emission")) 

dev.off() 

