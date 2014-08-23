
# below two lines makes the script independent of the path 
# where it is downlaoded and executed from
setwd(script_path)


# read the data into "filtered_data" variable to be
# used later for plotting
script_path <- dirname(sys.frame(1)$ofile)
source("data-in.R")

library(ggplot2) 


png(filename = "plot6.png",  
    width = 480, height = 480,  
    units = "px") 

# filter data for the two regions


p25BAandLA <- summarize(regroup(filter(pm25Data, fips == "24510" | fips == "06037"), 
                  list("year","fips")), total_emissions = sum(Emissions))

p25BAandLA$fips_name <- sapply(p25BAandLA$fips,
                                function(x) {switch(x,  "24510" = "Baltimore City", 
                                                        "06037" = "Los Angeles County")}) 


# Create the plot
plot6 <- qplot(year, total_emissions, data = p25BAandLA , color = fips_name) + 
     geom_path() + 
     geom_point() +  
     scale_x_continuous(breaks = seq(1999, 2008, 3), 
                        minor_breaks = seq(1999, 2008, 1)) + 
     ggtitle(expression('Comparison of Total emissions from Motor Vehicle Sources in\n  Baltimore City and Los Angeles County from 1999 to 2008')) + 
     xlab("Year") + 
     ylab("Total Emissions") +
     scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

print(plot6)

dev.off()

