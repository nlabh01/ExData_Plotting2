
# below two lines makes the script independent of the path 
# where it is downlaoded and executed from
script_path <- dirname(sys.frame(1)$ofile)
setwd(script_path)


# read the data into "filtered_data" variable to be
# used later for plotting
script_path <- dirname(sys.frame(1)$ofile)
source("data-in.R")

library(dplyr) 
library(ggplot2) 

pm25ForBaltimore_4types <- summarize(regroup(filter(pm25Data, fips == "24510"), 
    list("year","type")), total_emissions = sum(Emissions)) 


##  Create grouped line plot. 
  
png("plot3.png", width = 480, height = 480) 
plot3 <- qplot(year, total_emissions, data = pm25ForBaltimore_4types , color = type) + 
    geom_path() + 
    geom_point() +  
    scale_x_continuous(breaks = seq(1999, 2008, 3), 
        minor_breaks = seq(1999, 2008, 1)) + 
    ggtitle(expression('Total emissions from PM'[2.5]*' in Baltimore City, MD')) + 
    xlab("Year") + 
    ylab("Total emissions") 

print(plot3)

dev.off()

