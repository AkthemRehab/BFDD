PCA_t_test_X <- list()
for (i in 1: length(PCA_t_test)){
     PCA_t_test_X[[i]] <- list()
     for (j in 1:length(PCA_t_test[[i]])){
          PCA_t_test_X[[i]][[j]] <- PCA_t_test[[i]][[j]]$x  
     }
}

#Select how many PCs to use
#scree plot using variable for number of variables
noV <- 10
PCA_t_test_X_10V <- list()
for (i in 1: length(PCA_t_test_X)){
     PCA_t_test_X_10V[[i]] <- list()
     for (j in 1:length(PCA_t_test_X[[i]])){
          PCA_t_test_X_10V[[i]][[j]] <- PCA_t_test_X[[i]][[j]][,1:noV]
     }
}

#Rename the PCs per run
for (i in 1:length(PCA_t_test_X_10V)){
     for (j in 1:length(PCA_t_test_X_10V[[i]])){
          colnames(PCA_t_test_X_10V[[i]][[j]]) <- paste("V", j, colnames(PCA_t_test_X_10V[[i]][[j]]), sep="_")
     }
}

#Change the matrix to data.frame
PCA_t_test_X_10V <- lapply(PCA_t_test_X_10V, function(x)lapply(x, as.data.frame))

#Concatenate columns of each variable to be a one big data frame for each run.
#Caution: make sure you run it once, or else it will ruin all of the data
for (i in 1: length(PCA_t_test_X_10V)){
     PCA_t_test_X_10V[[i]] <- list.cbind(PCA_t_test_X_10V[[i]])
}

# the chunk of code to extract the ntimes for depmix
n_times_depmix <- NULL
for (i in 1: length(PCA_t_test_X_10V)){
     n_times_depmix <- c(n_times_depmix, nrow(PCA_t_test_X_10V[[i]]))
}

#rbinding all the runs in one data frame for the HMM
PCA_t_test_X_10V_1DF <- list.rbind(PCA_t_test_X_10V)

source("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/Code/5- Results.R")
