library(rlist)
library(pins)
board_register_github(name = "GitHub-BFDD", repo = "AkthemRehab/BFDD", branch = "main", token = "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")

init_file_list <- pin_get("init-file-list", board = "GitHub-BFDD")
Results <- pin_get("Results", board = "GitHub-BFDD")

setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Data test")
file_list <- data.frame(file_list=list.files(pattern = "*.*"))

if(!identical(dim(setdiff(file_list, init_file_list))[1],as.integer(0))){
     temp <- c(setdiff(file_list, init_file_list))
     test_1st <- lapply(temp$file_list, read.delim, header = F, colClasses = c("NULL", "NULL", "NULL", "NULL", "NULL", 
                                                                     "NULL", NA, NA))
     ID = c(1:length(test_1st))
     test_1st_binded <- mapply(cbind, test_1st, "ID"=ID, SIMPLIFY=F)
     test_1st_binded <- list.rbind(test_1st_binded)
     init_file_list <- file_list
     pin(init_file_list, "init-file-list", board = "GitHub-BFDD")
     source("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Code/2- Transform - Overlapping Windows.R")
} else
     print("no new files found")
