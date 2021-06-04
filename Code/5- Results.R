library(depmixS4)

for(n in 1:length(temp)){
     online_range <- (1+((n-1)*625)):(n*625)
     States_3_OM <- depmix(list(V_1_PC1~1, V_1_PC2~1, V_1_PC3~1, V_1_PC4~1, V_1_PC5~1, V_1_PC6~1, V_1_PC7~1, V_1_PC8~1, 
                                V_1_PC9~1, V_1_PC10~1, V_2_PC1~1, V_2_PC2~1, V_2_PC3~1, V_2_PC4~1, V_2_PC5~1, 
                                V_2_PC6~1, V_2_PC7~1, V_2_PC8~1, V_2_PC9~1, V_2_PC10~1), 
                           data = PCA_t_test_X_10V_1DF[online_range,], nstates = 3, 
                           family = list(gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), 
                                         gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), 
                                         gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), gaussian(), 
                                         gaussian(), gaussian()))
     Set_Pars <- setpars(States_3_OM, getpars(Fit_3_States))
     Results <- c(Results, logLik(Set_Pars))
}

setwd("D:/Documents/One Drive/OneDrive - Alexandria University/IMS Bearing/BFDD/init")
write.csv(Results, file="Results.csv")

Results_DF <- as.data.frame(Results)
Results_DF$Z <- (Results_DF$Results - u)/sd
Results_DF$Threshold <- -3
