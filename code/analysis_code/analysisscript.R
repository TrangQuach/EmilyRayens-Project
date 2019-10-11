###############################
# analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder


library(ggplot2)
library(dplyr)
library(broom)


p1 <- Pc %>% ggplot(aes(x=Neutrophils, y=PcStatus)) + geom_point() + geom_smooth(method='lm')


#save figure

ggsave(filename="./results/resultfigure.png",plot=p1) 


# fit linear model

lmfit <- lm(Neutrophils ~ PcStatus, Pc)  

# place results from fit into a data frame with the tidy function

lmtable <- broom::tidy(lmfit)

# save table  

saveRDS(lmtable, file = "./results/resulttable.rds")


  