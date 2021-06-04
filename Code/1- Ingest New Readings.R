library(rlist)

init_file_list <- pin_get("init_file_list", board = "GitHub-BFDD")
Results <- pin_get("Results", board = "GitHub-BFDD")
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
     pin(init_file_list, board = "GitHub-BFDD")
     source("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Code/2- Transform - Overlapping Windows.R")
} else
     print("no new files found")
