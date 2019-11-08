###############################
# analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

library(readxl)
Pc <- read_excel("data/raw_data/Pc.xlsx")

library(ggplot2)
library(dplyr)
library(broom)
library(kableExtra)


p1 <- Pc %>% ggplot(aes(x=PcStatus, y=Neutrophils)) + geom_point() + geom_smooth(method='lm')

p2 <- factor(sample(Vaccinated("0","1"), 10, replace=TRUE))
p3 <- p2 %>% ggplot(aes(x=Vaccinated, y=Neutrophils)) + geom_bar(stat="identity") 

#save figures

ggsave(filename="./results/resultfigure.png",plot=p1) 
ggsave(filename="./results/resultfigure2.png",plot=p3) 

# fit linear model

lmfit <- lm(PcStatus ~ Neutrophils, Pc)  

# place results from fit into a data frame with the tidy function

lmtable <- broom::tidy(lmfit)

# save table  

saveRDS(lmtable, file = "./results/resulttable.rds")


# make a table
a1 <- aggregate(Pc[, 3:9], list(Pc$Identifier), mean, na.rm=TRUE)
a2 <- aggregate(Pc[, 3:9], list(Pc$Vaccinated), mean, na.rm=TRUE)

t1 <- kable(a1, caption = "Table 1")
t2 <- kable(a2, caption = "Table 2")

saveRDS(t1, file = "./results/resulttable.rds")
saveRDS(t2, file = "./results/resulttable2.rds")
  