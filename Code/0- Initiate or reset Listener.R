#check out the butcher package to streamline the model file
#check out the pins package to cache and load the model
load("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init/Fit_3_States.RData")
#mean and standard deviation are obtained from the training data
#mean and SD 
u <- -29764.73
sd <- 463.4977

init_file_list <- character(0)
Results <- NULL
setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init")
save(init_file_list, file = "init_file_list.RData")
write.csv(Results, file="Results.csv")