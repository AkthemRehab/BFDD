setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Data test")
library(purrr)

overlap <- 32
window_size <- 512

start_pos <- seq(1, 20480, by = overlap)

lst_512_32 <- list()

for(i in unique(test_1st_binded$ID)){
     lst_512_32[[i]] <- lapply(start_pos, function(x) test_1st_binded[test_1st_binded$ID==i,][(c(x:(x + window_size-1))),])
}

#source()