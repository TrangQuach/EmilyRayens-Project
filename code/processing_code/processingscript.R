###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the processed_data folder

#load needed packages. make sure they are installed.
library(dplyr)

#load data. path is relative to project directory.
Pc <- read.csv("data/raw_data/Pc.csv")



#take a look at the data
dplyr::glimpse(Pc)



#save data as RDS
saveRDS(cleandata, file = "./data/processed_data/processeddata.rds")
