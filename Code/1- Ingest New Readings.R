library(rlist)

load("init_file_list.RData")
setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Data test")

file_list <- list.files(pattern = "*.*")

if(!identical(setdiff(file_list, init_file_list),character(0))){
     temp <- setdiff(file_list, init_file_list)
     test_1st <- lapply(temp, read.delim, header = F, colClasses = c("NULL", "NULL", "NULL", "NULL", "NULL", 
                                                                     "NULL", NA, NA))
     ID = c(1:length(test_1st))
     test_1st_binded <- mapply(cbind, test_1st, "ID"=ID, SIMPLIFY=F)
     test_1st_binded <- list.rbind(test_1st_binded)
     init_file_list <- file_list
     setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init")
     save(init_file_list, file = "init_file_list.RData")
} else
     print("no new files found")

#source()