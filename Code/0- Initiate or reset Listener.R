#check out the butcher package to streamline the model file
#check out the pins package to cache and load the model
#Create the task schedule job
library(taskscheduleR)
myscript <- ("D:/Documents/One Drive/OneDrive - Alexandria University/1- Ingest New Readings.R")
taskscheduler_create(taskname = "Ingest-New-Readings", rscript = myscript,
                     schedule = "MINUTE", starttime = "13:46", modifier = 1)

#Check all tasks
taskscheduler_ls()

#delete the task
taskscheduler_delete(taskname = "Ingest-New-Readings")

init_file_list <- character(0)
Results <- data.frame(Results=numeric(), stringsAsFactors = F)
setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init")
save(init_file_list, file = "init_file_list.RData")
save(Results, file="Results.RData")
