
fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
downloadFile="exdata-data-NEI_data.zip"
dataFilePM25="summarySCC_PM25.rds"
dataFileSCC="Source_Classification_Code.rds"

# download the file only if not already found
if ( .Platform$OS.type  %in% "windows" ) {
   # Using default download method for Win OS
   if(!file.exists(downloadFile)){
        download.file(fileURL,downloadFile)
   }
} else { 
   # Using curl for download for Mac/Unix OS
   if(!file.exists(downloadFile)){
        download.file(fileURL,downloadFile,"curl")
   }
}


# If file not present, unzip the downloaded file to retrieve it
if(!file.exists(dataFilePM25) || !file.exists(dataFileSCC)){
   unzip(downloadFile)
}

# read the complete data files
pm25Data <- readRDS("./summarySCC_PM25.rds")
sccData <- readRDS("./Source_Classification_Code.rds")



