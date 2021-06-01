init_file_list <- character(0)
Results <- NULL
setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init")
save(init_file_list, file = "init_file_list.RData")
write.csv(Results, file="Results.csv")
