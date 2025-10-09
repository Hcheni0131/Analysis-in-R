setwd("Path_to/Data.txt")
library(tidyverse)
library(ggplot2)
data <- read.table("Data.txt",sep = "\t",header = TRUE)
head(data)
level <- data[,1]
level <- rev(level)
data$NAME <- factor(data$NAME,level=level)
ggplot(data, aes(x = NAME,y=ALL))+geom_col(aes(y = ALL), fill = "#91A8D0")+geom_col(aes(y = ATG), fill = "#F7CAC9")+scale_y_continuous(limits = c(-9, 9))+coord_polar(start = 2.82,direction=-1)+theme_minimal() 
