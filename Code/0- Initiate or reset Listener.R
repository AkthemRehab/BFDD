#check out the butcher package to streamline the model file

#Creating the pins connection
#Remember that we created the GITHUB_PAT first. check for its existence using below line
nchar(Sys.getenv("GITHUB_PAT")) > 0

#taskscheduleR
#Create the task schedule job
library(taskscheduleR)
myscript <- ("D:/Documents/One Drive/OneDrive - Alexandria University/1- Ingest New Readings.R")
taskscheduler_create(taskname = "Ingest-New-Readings", rscript = myscript,
                     schedule = "MINUTE", starttime = "01:30", modifier = 5)
#delete the task
taskscheduler_delete(taskname = "Ingest-New-Readings")

#Pin the model
#pin(Fit_3_States, board = "folder")

init_file_list <- NULL
Results <- data.frame(Results=numeric(), stringsAsFactors = F)

pin(init_file_list, "init-file-list",board = "GitHub-BFDD")
pin(Results, "Results",board = "GitHub-BFDD")
