library(rlist)
folder_name <- "Data test"
setwd(folder_name)

load("init_file_list.RData")
file_list <- list.files(pattern = "*.*")

if(!identical(setdiff(file_list, init_file_list),character(0))){
     temp <- setdiff(file_list, init_file_list)
     test_1st <- lapply(temp, read.delim, header = F, colClasses = c("NULL", "NULL", "NULL", "NULL", "NULL", 
                                                                     "NULL", NA, NA))
     ID = c(1:length(test_1st))
     test_1st_binded <- mapply(cbind, test_1st, "ID"=ID, SIMPLIFY=F)
     test_1st_binded <- list.rbind(test_1st_binded)
     init_file_list <- file_list
     save(init_file_list, file = "init_file_list.RData")
} else
     print("no new files found")
