#Remove windows having NAs
lst_512_32 <- lapply(lst_512_32, function(x) discard(x, ~any(is.na(.x))))

delete.NULLs  <-  function(x.list){
     x.list[unlist(lapply(x.list, length) != 0)]
}
lst_512_32 <- delete.NULLs(lst_512_32)

#Remove the burst# column 
#VIP - third column if first test and second for the other tests - always remember to check the number in the last line
no_NA_lst_NC <- list()
for (i in 1:length(lst_512_32)){
     no_NA_lst_NC[[i]] <- list()
     for (j in 1:length(lst_512_32[[i]])){
          no_NA_lst_NC[[i]][[j]] <- lst_512_32[[i]][[j]][,-3]
     }
}

#Save memory by keeping only one object
lst_512_32 <- no_NA_lst_NC
rm(no_NA_lst_NC)

test <- list()
for (i in 1:length(lst_512_32)){
     test[[i]] <- list()
     for (j in 1:ncol(lst_512_32[[i]][[1]])){
          test[[i]][[j]] <- sapply(lst_512_32[[i]], `[[`, j)
     }
}

t_test <- list()
for (i in 1:length(test)){
     t_test[[i]] <- list()
     for (j in 1:length(test[[i]])){
          t_test[[i]][[j]] <- t(test[[i]][[j]])
     }
}

PCA_t_test <- lapply(t_test, function(x)lapply(x, prcomp, center = T, scale. = T))

#source()