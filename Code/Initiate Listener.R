#Initiate the listener
init_file_list <- character(0)
save(init_file_list, file = "init_file_list.RData")


folder_name <- "Data test"
setwd(folder_name)

file_list <- list.files(pattern = "*.*")
